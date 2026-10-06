-- 02_functions/C1_fn_validate_payroll.sql
-- Author: NGOGA Honore (29693)
-- Validates one employee's payroll data.
-- Combines: SELECT INTO, GOTO (single exit point), reuse of
-- functions B1, B3 and B4, and exception handling.

CREATE OR REPLACE FUNCTION fn_validate_payroll (
  p_emp_id IN NUMBER
) RETURN VARCHAR2
IS
  v_emp employees%ROWTYPE;
  v_msg VARCHAR2(200);
BEGIN
  SELECT *
    INTO v_emp
    FROM employees
   WHERE emp_id = p_emp_id;

  -- Rule 1: salary must exist and be positive
  IF v_emp.salary IS NULL OR v_emp.salary <= 0 THEN
    v_msg := 'INVALID: missing or non-positive salary';
    GOTO finish;
  END IF;

  -- Rule 2: hire date must exist and not be in the future
  IF v_emp.hire_date IS NULL OR v_emp.hire_date > SYSDATE THEN
    v_msg := 'INVALID: hire date missing or in the future';
    GOTO finish;
  END IF;

  -- Rule 3: department must exist (reuses B4)
  IF fn_dept_name(v_emp.dept_id) = 'Unknown Department' THEN
    v_msg := 'INVALID: unknown department';
    GOTO finish;
  END IF;

  -- All checks passed (reuses B1 and B3)
  v_msg := 'VALID: annual=' || fn_annual_salary(v_emp.salary) ||
           ', monthly tax=' || fn_calculate_tax(v_emp.salary);

  <<finish>>
  RETURN v_msg;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'INVALID: employee ' || p_emp_id || ' not found';
  WHEN OTHERS THEN
    RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/