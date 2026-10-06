-- 02_functions/B2_fn_years_of_service.sql
-- Author: NGOGA Honore (29693)
-- Returns the number of full years worked since the hire date.
-- Returns NULL if the hire date is missing or in the future.

CREATE OR REPLACE FUNCTION fn_years_of_service (
  p_hire_date IN DATE
) RETURN NUMBER
IS
BEGIN
  IF p_hire_date IS NULL OR p_hire_date > SYSDATE THEN
    RETURN NULL;
  END IF;

  RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hire_date) / 12);
END fn_years_of_service;
/