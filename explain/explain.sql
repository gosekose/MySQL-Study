explain
select * from dept_emp de
where de.emp_no = (select e.emp_no
                   from employees e where e.first_name = 'Georgi'
                                      and e.last_name = 'Facello' limit 1);

show index from employees;

# simple
explain
select * from dept_emp where emp_no = 12000;

# union
explain
select * from (
                  (select emp_no from employees e1 limit 10) union all
                  (select emp_no from employees e2 limit 10) union all
                  (select emp_no from employees e3 limit 10)) tb;


explain analyze
select * from dept_emp de
                  join employees e on de.emp_no = e.emp_no
where de.from_date > '1996-08-03';

explain
select *
from employees e1 where e1.emp_no in (
    select e2.emp_no from employees e2 where e2.first_name = 'Matt'
    union
    select e3.emp_no from employees e3 where e3.last_name = 'Matt'
);

explain analyze
select *
from employees e1 where e1.emp_no in (
    select e2.emp_no from employees e2 where e2.first_name = 'Matt'
    union
    select e3.emp_no from employees e3 where e3.last_name = 'Matt'
);

# union all vs union => union all은 중복 제거 및 정렬 실행 x

# subquery
explain
select e.first_name,
       (select count(*) from dept_emp de, dept_manager dm
        where dm.dept_no = de.dept_no) as cnt
from employees e where e.emp_no = 10001;

# dependent subquery
explain
select e.first_name, (select count(*) from dept_emp de, dept_manager dm
                      where dm.dept_no = de.dept_no and de.emp_no=e.emp_no) as cnt
from employees e
where e.first_name = 'Matt';


explain
select *
from (select de.emp_no from dept_emp de group by de.emp_no) tb,
     employees e where e.emp_no = tb.emp_no;


# materialized
explain
select * from employees e
where e.emp_no in (select emp_no from salaries where salary between 70000 and 80000);


#partitions
create table employees_2 (
                             emp_no int not null,
                             birth_date date not null,
                             first_name varchar(14) not null,
                             last_name varchar(16) not null,
                             gender enum('M', 'F') not null,
                             hire_date date not null,
                             primary key (emp_no, hire_date)
) partition by range columns (hire_date) (
    partition p1986_1990 values less than ('1990-01-01'),
    partition p1991_1995 values less than ('1996-01-01'),
    partition p1996_2000 values less than ('2000-01-01'),
    partition p2001_2005 values less than ('2006-01-01')
    );

insert into employees_2 select * from employees;

explain
select * from employees_2 where hire_date between '1999-11-15' and '2000-01-15';

explain
select * from departments
where dept_no in (select dept_no from dept_emp where emp_no = 10001);

explain
select d.* from departments d
                    join dept_emp de on d.dept_no = de.dept_no
where de.emp_no = 10001;

# range
explain
select * from employees where emp_no between 10002 and 10004;

# index_merge
explain
select * from employees where emp_no between 10001 and 11000
                           or first_name = 'Smith';

# index
explain
select * from departments order by dept_name desc limit 10;

explain
select e.* from employees e
                    join dept_emp de on e.emp_no = de.emp_no
where e.emp_no > 16000;