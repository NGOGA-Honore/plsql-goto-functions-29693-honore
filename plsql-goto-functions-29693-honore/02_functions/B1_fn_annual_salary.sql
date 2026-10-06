-- 02_functions/B1_fn_annual_salary.sql
-- Author: NGOGA Honore (29693)
-- Returns the annual salary (monthly salary x 12).
-- Returns NULL if the salary is missing or negative.

CREATE OR REPLACE FUNCTION fn_annual_salary (
  p_monthly_salary IN NUMBER
) RETURN NUMBER
IS
BEGIN
  IF p_monthly_salary IS NULL OR p_monthly_salary < 0 THEN
    RETURN NULL;
  END IF;

  RETURN p_monthly_salary * 12;
END fn_annual_salary;
/