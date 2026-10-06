-- 02_functions/B3_fn_calculate_tax.sql
-- Author: NGOGA Honore (29693)
-- Calculates monthly income tax using progressive brackets:
--   0       - 60,000    : 0%
--   60,001  - 100,000   : 10% on the part above 60,000
--   100,001 - 200,000   : 20% on the part above 100,000
--   above 200,000       : 30% on the part above 200,000
-- Returns 0 if the salary is missing or not positive.

CREATE OR REPLACE FUNCTION fn_calculate_tax (
  p_salary IN NUMBER
) RETURN NUMBER
IS
  v_tax NUMBER := 0;
BEGIN
  IF p_salary IS NULL OR p_salary <= 0 THEN
    RETURN 0;
  END IF;

  IF p_salary <= 60000 THEN
    v_tax := 0;
  ELSIF p_salary <= 100000 THEN
    v_tax := (p_salary - 60000) * 0.10;
  ELSIF p_salary <= 200000 THEN
    v_tax := 4000 + (p_salary - 100000) * 0.20;
  ELSE
    v_tax := 24000 + (p_salary - 200000) * 0.30;
  END IF;

  RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/