-- 01_goto/A4_rewrite_no_goto.sql
-- Author: NGOGA Honore (29693)
-- Rewrites A1 and A2 WITHOUT GOTO, using CASE and CONTINUE.
-- Same results, but easier to read and maintain.

SET SERVEROUTPUT ON;

---------------------------------------------------------------
-- A1 rewritten: number classifier using CASE (no labels, no jumps)
---------------------------------------------------------------
DECLARE
  TYPE t_nums IS TABLE OF NUMBER;
  v_list t_nums := t_nums(25, -7, 0);
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- A1 without GOTO ---');
  FOR i IN 1 .. v_list.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(v_list(i) || ' is ' ||
      CASE
        WHEN v_list(i) > 0 THEN 'POSITIVE'
        WHEN v_list(i) < 0 THEN 'NEGATIVE'
        ELSE 'ZERO'
      END);
  END LOOP;
END;
/

---------------------------------------------------------------
-- A2 rewritten: salary review using CONTINUE instead of GOTO
---------------------------------------------------------------
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- A2 without GOTO ---');
  FOR r IN (SELECT emp_id, full_name, salary
            FROM employees
            ORDER BY emp_id) LOOP

    IF r.salary IS NULL THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || r.full_name ||
                           ': NO SALARY RECORDED - skipped');
      CONTINUE;   -- replaces GOTO next_employee
    END IF;

    DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || r.full_name || ': ' ||
      r.salary || ' -> ' ||
      CASE
        WHEN r.salary < 300000  THEN 'LOW (recommend raise)'
        WHEN r.salary < 1000000 THEN 'MEDIUM (standard review)'
        ELSE 'HIGH (no change)'
      END);
  END LOOP;
END;
/

-- Comparison:
-- * No labels and no NULL; placeholders are needed.
-- * No risk of "falling through" to the wrong label.
-- * CONTINUE clearly says "skip to the next loop iteration".
-- * The code is shorter and reads top to bottom.