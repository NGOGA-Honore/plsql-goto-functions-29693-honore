-- 02_functions/B4_fn_dept_name.sql
-- Author: NGOGA Honore (29693)
-- Returns the department name for a department ID.
-- Uses exception handling for IDs that do not exist.

CREATE OR REPLACE FUNCTION fn_dept_name (
  p_dept_id IN NUMBER
) RETURN VARCHAR2
IS
  v_name departments.dept_name%TYPE;
BEGIN
  SELECT dept_name
    INTO v_name
    FROM departments
   WHERE dept_id = p_dept_id;

  RETURN v_name;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Unknown Department';
  WHEN OTHERS THEN
    RETURN 'Error: ' || SQLERRM;
END fn_dept_name;
/