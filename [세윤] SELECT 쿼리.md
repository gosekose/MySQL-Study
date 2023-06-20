# SELECT 쿼리 작성 

* WITH ROLLUP
  * GROUP BY가 사용된 쿼리에서는 그루핑된 그룹별로 소계를 가져올 수 있는 롤업(ROLLUP) 기능을 사용할 수 있음 
  * ROLLUP으로 출력되는 소계는 단순히 최종 합만 가져오는 것이 아니라 GROUP BY예 사용된 컬럼의 개수에 따라 소계의 레벨이 달라짐
  * 하단에 
  ``` sql
  select
      if (grouping(first_name), 'All first_name', first_name) as first_name,
      if (grouping(last_name), 'All last_name', last_name) as last_name,
      count(*)
  from employees
  where first_name = 'Aamer' or first_name is null
  group by first_name, last_name with rollup;
  ```
  ![image](https://github.com/gosekose/MySQL-Study/assets/88478829/a0ebaee6-32d8-41a4-9b27-2ca154dc490a)

* 레코드를 칼럼으로 변환하기 
  * 레코드를 칼럼으로 변환하는 작업을 할 때는 적절한 집계(집합) 함수를 활용   
  ```sql
  select
    sum(case when dept_no = 'd001' then emp_count else 0 end) as count_d001,
    sum(case when dept_no = 'd002' then emp_count else 0 end) as count_d002
  from (
        select dept_no, count(*) as emp_count from dept_emp group by dept_no
     ) as tb_derived;
  ```
  
* case when / if 
  * 10년 단위별 부서별 입사 사원수를 출력해야하는 로직의 경우 하나의 컬럼을 여러 칼럼으로 분리하기 위해 case when 적용 가능    
  ```sql
  select
    de.dept_no,
    sum(case when e.hire_date between '1980-01-01' and '1989-12-31' then 1 else 0 end) as year_1980,
    sum(case when e.hire_date between '1990-01-01' and '1999-12-31' then 1 else 0 end) as year_1990,
    count(*) as total
  from dept_emp as de, employees as e
  where e.emp_no = de.emp_no
  group by de.dept_no;
  
  select
    de.dept_no,
    sum(IF(e.hire_date between '1980-01-01' and '1989-12-31', 1, 0)) as year_1980,
    sum(IF(e.hire_date between '1990-01-01' and '1999-12-31', 1, 0)) as year_1990,
    count(*)                                                         as total
  from dept_emp as de, employees as e
  where e.emp_no = de.emp_no
  group by de.dept_no;
 
  ```
  
* 여러 방향으로 동시 정렬 
  ```sql
  alter table salaries add index ix_salary_fromdate (salary desc, from_date asc);
  ```
  
* From절의 서브 쿼리 
  * MySQL5.7 버전부터는 옵티마이저가 FROM 절의 서브쿼리를 외부 쿼리로 병합하는 최적화를 수행하도록 개선 

* Where절의 서브 쿼리 
  * 동등 / 대소 비교 
    * 서브쿼리를 먼저 실행한 후 상수로 변환 -> 상숫값으로 서브쿼리를 대체하여 나머지 쿼리 부분 처리   
  ```sql
  select  * from dept_emp de
  where de.emp_no = (select e.emp_no from employees e where e.first_name = 'Georgi' and   e.last_name = 'Facello' limit 1)
  ```
  ![image](https://github.com/gosekose/MySQL-Study/assets/88478829/cf4400ce-22e7-4d99-a12d-6cc3aeef6795)

  * 단일 비교가 아닌 튜플 비교
     * 서브쿼리가 상수화되지 않고 full 스캔되는 것을 확인할 수 있음  
  ```sql
  EXPLAIN
  select  * from dept_emp de
  where (emp_no, from_date) = (select emp_no, from_date from salaries where     emp_no = 100001 limit 1);
  ```
  ![image](https://github.com/gosekose/MySQL-Study/assets/88478829/f8181638-465b-4f3e-aa47-8c7e4ca53f67)

* 세미 조인 
  * 세미 조인은 두 개의 테이블 사이에서 특정 조건을 만족하는 레코드가 존재하는 경우 해당 레코드를 반환하는 방식의 조인 
  * 서브쿼리와 함꼐 exists 또는 in keyword를 이용해 세미 조인을 사용하며, 한 테이블의 특정 레코드가 다른 테이블과 일치하는 경우에만 해당 레코드를 반환하고 싶을 때 사용함 
  * 서브쿼리 성능 향상을 위해서는 서브 쿼리 내부의 where 절에 인덱스가 있는 것이 좋음 
   ```sql
    explain select * from employees e
    where e.emp_no in (
      select de.emp_no from dept_emp de where de.from_date = '1995-01-01'
    );
   ```
   
* 잠금을 사용하는 select 
  * InnoDB 테이블에 대해서는 레코드를 select 할 때, 레코드에 아무런 잠금을 걸지 않음 
  * 잠금 없는 읽기 (Non-Locking Consistent Read)
  * select 쿼리를 이용해 읽은 레코드의 값을 애플리케이션에서 가공해서 다시 업데이트하고자 할 때 select가 실행된 후 다른 트랜잭션이 그 칼럼의 값을 변경할 수 없도록 해야 함 
  * FOR SHARE, FOR UPDATE 옵션 
  * FOR SHARE는 select 쿼리로 읽은 레코드에 대한 읽기 잠금, FOR UPDATE는 읽은 레코드에 대한 쓰기 잠금 
  * 잠금 옵션은 모두 자동 커밋 (AUTO-COMMIT)이 비활성화, 트랜잭션이 유지되는 상황에서 적용 가능 
    * FOR SHARE: select된 레코드에 대해 읽기 잠금을 설정, 다른 세션에서 해당 레코드를 변경하지 못하도록 함, 다른 세션에서 잠금이 걸린 레코드를 읽는 것은 가능 
    * FOR UPDATE: UPDATE 절은 쓰기 잠금을 설정, 다른 트랜잭션에서는 그 레코드를 변경하는 것뿐만 아니라, 읽기(FOR SHARE 절을 사용하는 쿼리)도 수행 불가능   
    * 중요한 점은 select ~ from으로 단순 읽기는 잠금 대기 없이 반환함 

     ![image](https://github.com/gosekose/MySQL-Study/assets/88478829/ef25acaf-5fda-4137-8d33-7674262ddb52)
     ![image](https://github.com/gosekose/MySQL-Study/assets/88478829/9a58046c-ed50-4fe3-9829-a0d72d449b87)
     --> 잠금 없이 반환 
     
     ![image](https://github.com/gosekose/MySQL-Study/assets/88478829/8018a279-d722-4b2c-80e9-24fba33f4439)
     --> FOR UPDATE는 잠금 적용 

* 잠금 테이블 적용 
  ```sql
  select * from employees e 
  inner join dept_emp de on e.emp_no = de.emp_no
  inner join departments d on de.dept_no = d.dept_no
  where e.emp_no = 10001
  for update;
  ```
  * innoDB 스토리지 엔진은 3개 테이블에서 읽은 레코드에 대해 몯 쓰기 잠금을 걸게 됨 
  * 8.0 버전 이상부터는 선택적 잠금 적용 가능 
  ```
