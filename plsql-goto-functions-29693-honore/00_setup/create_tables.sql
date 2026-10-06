-- 00_setup/create_tables.sql
-- Author: NGOGA Honore (29693)
-- Creates and fills the tables used by all exercises.

SET SERVEROUTPUT ON;

-- Drop old tables so the script can be re-run safely
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
  dept_id   NUMBER PRIMARY KEY,
  dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
  emp_id    NUMBER PRIMARY KEY,
  full_name VARCHAR2(100) NOT NULL,
  salary    NUMBER(10,2),
  hire_date DATE,
  dept_id   NUMBER
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'HR');

INSERT INTO employees VALUES (1, 'Alice Mukamana', 450000,  DATE '2018-03-15', 10);
INSERT INTO employees VALUES (2, 'Brian Kamanzi',  1200000, DATE '2015-07-01', 20);
INSERT INTO employees VALUES (3, 'Claire Uwase',   250000,  DATE '2023-01-10', 30);
INSERT INTO employees VALUES (4, 'David Nkurunziza', NULL,  DATE '2020-05-20', 20);  -- missing salary (test case)
INSERT INTO employees VALUES (5, 'Eva Ruzindana',  800000,  DATE '2030-01-01', 99);  -- future date + unknown dept (test case)

COMMIT;

SELECT * FROM departments;
SELECT * FROM employees;