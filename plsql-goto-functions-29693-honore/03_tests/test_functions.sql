-- 03_tests/test_functions.sql
-- Author: NGOGA Honore (29693)
-- Tests each function (B1-B4) with normal, edge and invalid inputs.

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('===== B1: fn_annual_salary =====');
  DBMS_OUTPUT.PUT_LINE('100000  -> ' || fn_annual_salary(100000));            -- expect 1200000
  DBMS_OUTPUT.PUT_LINE('0       -> ' || fn_annual_salary(0));                 -- expect 0
  DBMS_OUTPUT.PUT_LINE('NULL    -> ' || NVL(TO_CHAR(fn_annual_salary(NULL)), 'NULL'));   -- expect NULL
  DBMS_OUTPUT.PUT_LINE('-500    -> ' || NVL(TO_CHAR(fn_annual_salary(-500)), 'NULL'));   -- expect NULL

  DBMS_OUTPUT.PUT_LINE('===== B2: fn_years_of_service =====');
  DBMS_OUTPUT.PUT_LINE('2018-03-15 -> ' || fn_years_of_service(DATE '2018-03-15'));      -- expect 8
  DBMS_OUTPUT.PUT_LINE('today      -> ' || fn_years_of_service(SYSDATE));                -- expect 0
  DBMS_OUTPUT.PUT_LINE('2030-01-01 -> ' || NVL(TO_CHAR(fn_years_of_service(DATE '2030-01-01')), 'NULL')); -- expect NULL

  DBMS_OUTPUT.PUT_LINE('===== B3: fn_calculate_tax =====');
  DBMS_OUTPUT.PUT_LINE('50000   -> ' || fn_calculate_tax(50000));    -- expect 0
  DBMS_OUTPUT.PUT_LINE('80000   -> ' || fn_calculate_tax(80000));    -- expect 2000
  DBMS_OUTPUT.PUT_LINE('150000  -> ' || fn_calculate_tax(150000));   -- expect 14000
  DBMS_OUTPUT.PUT_LINE('250000  -> ' || fn_calculate_tax(250000));   -- expect 39000
  DBMS_OUTPUT.PUT_LINE('NULL    -> ' || fn_calculate_tax(NULL));     -- expect 0

  DBMS_OUTPUT.PUT_LINE('===== B4: fn_dept_name =====');
  DBMS_OUTPUT.PUT_LINE('10   -> ' || fn_dept_name(10));    -- expect Finance
  DBMS_OUTPUT.PUT_LINE('20   -> ' || fn_dept_name(20));    -- expect IT
  DBMS_OUTPUT.PUT_LINE('999  -> ' || fn_dept_name(999));   -- expect Unknown Department
END;
/