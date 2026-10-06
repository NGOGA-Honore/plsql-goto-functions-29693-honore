-- 01_goto/A3_illegal_goto.sql
-- Author: NGOGA Honore (29693)
-- Part 1: an ILLEGAL GOTO that jumps INTO an IF block (fails to compile).
-- Part 2: the FIXED version with the label moved outside the IF.

SET SERVEROUTPUT ON;

---------------------------------------------------------------
-- PART 1: ILLEGAL GOTO
-- Expected error: PLS-00375: illegal GOTO statement;
-- this GOTO cannot transfer control to label 'INSIDE_IF'
-- Reason: PL/SQL does not allow jumping INTO an IF, LOOP or
-- sub-block, because the program would skip the condition
-- that controls entry into that block.
---------------------------------------------------------------
DECLARE
  v_salary NUMBER := 450000;
BEGIN
  GOTO inside_if;   -- ILLEGAL: target label is inside the IF below

  IF v_salary > 300000 THEN
    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('Salary is above 300000');
  END IF;
END;
/

---------------------------------------------------------------
-- PART 2: FIXED VERSION
-- The label is now OUTSIDE the IF, so the jump is legal and the
-- IF condition is still checked normally.
---------------------------------------------------------------
DECLARE
  v_salary NUMBER := 450000;
BEGIN
  GOTO check_salary;   -- LEGAL: label is in the same block, outside the IF

  <<check_salary>>
  IF v_salary > 300000 THEN
    DBMS_OUTPUT.PUT_LINE('FIXED: Salary is above 300000');
  ELSE
    DBMS_OUTPUT.PUT_LINE('FIXED: Salary is 300000 or below');
  END IF;
END;
/