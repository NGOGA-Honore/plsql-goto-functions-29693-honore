-- 01_goto/A1_number_classifier.sql
-- Author: NGOGA Honore (29693)
-- Classifies numbers as POSITIVE, NEGATIVE or ZERO using GOTO.

SET SERVEROUTPUT ON;

DECLARE
  TYPE t_nums IS TABLE OF NUMBER;
  v_list t_nums := t_nums(25, -7, 0);   -- test values
  v_num  NUMBER;
BEGIN
  FOR i IN 1 .. v_list.COUNT LOOP
    v_num := v_list(i);

    IF v_num > 0 THEN
      GOTO positive;
    ELSIF v_num < 0 THEN
      GOTO negative;
    ELSE
      GOTO zero;
    END IF;

    <<positive>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
    GOTO next_num;

    <<negative>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
    GOTO next_num;

    <<zero>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is ZERO');

    <<next_num>>
    NULL;   -- a label must be followed by an executable statement
  END LOOP;
END;
/