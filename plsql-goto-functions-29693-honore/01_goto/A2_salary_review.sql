-- 01_goto/A2_salary_review.sql
-- Author: NGOGA Honore (29693)
-- Reviews each employee's salary. Uses GOTO to skip employees
-- with a missing salary and continue with the next one.

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('===== SALARY REVIEW =====');

  FOR r IN (SELECT emp_id, full_name, salary
            FROM employees
            ORDER BY emp_id) LOOP

    -- Skip employees with no salary
    IF r.salary IS NULL THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || r.full_name ||
                           ': NO SALARY RECORDED - skipped');
      GOTO next_employee;
    END IF;

    -- Categorise the salary
    IF r.salary < 300000 THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || r.full_name ||
                           ': ' || r.salary || ' -> LOW (recommend raise)');
    ELSIF r.salary < 1000000 THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || r.full_name ||
                           ': ' || r.salary || ' -> MEDIUM (standard review)');
    ELSE
      DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || r.full_name ||
                           ': ' || r.salary || ' -> HIGH (no change)');
    END IF;

    <<next_employee>>
    NULL;   -- label needs an executable statement after it
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('===== REVIEW COMPLETE =====');
END;
/