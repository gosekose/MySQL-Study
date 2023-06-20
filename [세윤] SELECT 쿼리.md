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
  
  
