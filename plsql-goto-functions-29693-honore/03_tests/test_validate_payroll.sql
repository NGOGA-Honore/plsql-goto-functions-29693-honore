-- 03_tests/test_validate_payroll.sql
-- Author: NGOGA Honore (29693)
-- Tests fn_validate_payroll on every employee and on a non-existent ID.

SELECT emp_id,
       full_name,
       fn_validate_payroll(emp_id) AS validation_result
FROM   employees
UNION ALL
SELECT 999, '(non-existent employee)', fn_validate_payroll(999)
FROM   dual
ORDER  BY 1;