-- 03_tests/B5_functions_in_select.sql
-- Author: NGOGA Honore (29693)
-- Uses the stored functions B1-B4 directly inside a SELECT statement.

SELECT e.emp_id,
       e.full_name,
       e.salary                          AS monthly_salary,
       fn_annual_salary(e.salary)        AS annual_salary,
       fn_years_of_service(e.hire_date)  AS years_of_service,
       fn_calculate_tax(e.salary)        AS monthly_tax,
       fn_dept_name(e.dept_id)           AS department
FROM   employees e
ORDER  BY e.emp_id;