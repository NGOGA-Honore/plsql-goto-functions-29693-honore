# PL/SQL GOTO Statements and Functions

**Student:** NGOGA Honore
**Student ID:** 29693
**Course:** Database Development with PL/SQL (INSY 8311)
**Instructor:** Eric Maniraguha
**Assignment:** Individual Assignment III

## Overview
This repository contains my solutions for Individual Assignment III. It covers
PL/SQL GOTO statements (including an illegal GOTO and its fix), stored functions,
exception handling, and calling functions from SQL. All scripts were developed and
tested in Oracle SQL Developer on Oracle Database XE.

## Repository Structure
| Folder / File | Content |
|---|---|
| `00_setup/create_tables.sql` | Creates and fills the `departments` and `employees` tables |
| `01_goto/A1_number_classifier.sql` | Classifies numbers as positive, negative or zero using GOTO |
| `01_goto/A2_salary_review.sql` | Reviews salaries; uses GOTO to skip employees with no salary |
| `01_goto/A3_illegal_goto.sql` | Illegal GOTO into an IF block (PLS-00375) and the fixed version |
| `01_goto/A4_rewrite_no_goto.sql` | A1 and A2 rewritten with CASE and CONTINUE instead of GOTO |
| `02_functions/B1_fn_annual_salary.sql` | Returns annual salary (monthly x 12) |
| `02_functions/B2_fn_years_of_service.sql` | Returns full years worked since hire date |
| `02_functions/B3_fn_calculate_tax.sql` | Calculates monthly tax using progressive brackets |
| `02_functions/B4_fn_dept_name.sql` | Returns department name; handles NO_DATA_FOUND |
| `02_functions/C1_fn_validate_payroll.sql` | Validates an employee's payroll data using GOTO, functions and exceptions |
| `03_tests/B5_functions_in_select.sql` | Uses all functions inside one SELECT |
| `03_tests/test_functions.sql` | Tests B1–B4 with normal, edge and invalid inputs |
| `03_tests/test_validate_payroll.sql` | Tests the payroll validator on all employees and a missing ID |
| `screenshots/` | Output screenshots for A1–A4, B5 and C1 |
| `docs/REFLECTION.md` | My reflection on the assignment |

## How to Run
1. Run `00_setup/create_tables.sql`.
2. Run the functions in `02_functions/` (B1 to B4, then C1).
3. Run the programs in `01_goto/`.
4. Run the test files in `03_tests/`.
5. Compare the results with the screenshots in `screenshots/`.

Use **F5 (Run Script)** in SQL Developer for all files, and **F9** for the SELECT
queries in `03_tests/` to see the result grid.

## Test Data Notes
The sample data includes two deliberately invalid employees used to test validation:
- **David Nkurunziza:** salary is NULL
- **Eva Ruzindana:** hire date is in the future and department 99 does not exist

## Notes
- I used an AI assistant (Claude) as a step-by-step guide during this assignment.
- I ran every script myself in SQL Developer, verified the outputs, took the
  screenshots, and wrote the reflection in my own words with the help of AI.
- I understand and can explain all the submitted code.
