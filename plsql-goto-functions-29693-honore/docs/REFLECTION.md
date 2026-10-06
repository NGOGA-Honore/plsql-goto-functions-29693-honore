Reflection — PL/SQL GOTO Statements and Functions

Student: NGOGA Honore (29693) Course: Database Development with PL/SQL (INSY 8311)

1. What I learned about GOTO

GOTO makes the program jump directly to a label, written like <<positive>>, somewhere else in the same block. In A1 the IF statement only decides which label to jump to, and the label is where the real work happens. I learned that a label must be followed by an executable statement, so when there is nothing to do at the end of the loop I had to write NULL; after <<next_num>>. I also understood why every branch ends with GOTO next_num: without it, execution "falls through" to the next labels, so a positive number would also print NEGATIVE and ZERO.

2. Illegal GOTO (A3)

In A3 I wrote a GOTO that jumps into a label placed inside an IF block. Oracle refused to compile it and gave the error PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_IF'. Oracle forbids jumping into an IF, a LOOP or a sub-block because the program would enter the block without checking the condition that controls it. I fixed it by moving the label outside the IF, so the jump is legal and the condition is still checked normally. The rule I will remember is: you can jump out of a block or within the same block, but never into one.

3. GOTO vs structured code (A4)

In A4 I rewrote A1 with CASE and A2 with CONTINUE, and the results were exactly the same. The structured version is shorter and easier to read because it goes from top to bottom without jumps, it does not need labels or NULL; placeholders, and there is no risk of falling through to the wrong label. CONTINUE clearly says "skip to the next employee", while GOTO next_employee makes the reader look for where the label is. GOTO is still acceptable in a few cases, like in C1, where every failed validation jumps to one single exit point (<<finish>>) so the function has only one RETURN in its main logic.

4. What I learned about functions

A function is a named PL/SQL block stored in the database that must return exactly one value with RETURN, while a procedure performs an action and does not have to return a value. Because a function returns a value, it can be used inside expressions and SQL statements. I used %TYPE in B4 so the variable v_name automatically has the same data type as departments.dept_name, and %ROWTYPE in C1 so one variable v_emp can hold a whole employee row. This is useful because if the table column changes, the code does not need to be changed. I also checked that all my functions compiled by querying user_objects, and all of them were VALID.

5. Functions in SQL (B5)

In B5 I called all four functions inside one SELECT statement, and Oracle ran them once for every employee row, giving annual salary, years of service, tax and department name in one result. This shows that stored functions can be reused directly in SQL just like built-in functions. A function used in a SELECT cannot do INSERT, UPDATE, DELETE or COMMIT, because a query is only supposed to read data, and changing the database while it is being read could give inconsistent results. All my functions only calculate and return a value, so they were allowed.

6. Exception handling

In B4, SELECT ... INTO raises NO_DATA_FOUND when the department ID does not exist. My exception handler catches it and returns 'Unknown Department' instead of crashing the whole query. In C1 the same exception returns 'INVALID: employee 999 not found' for an employee that does not exist. The test data proved that my checks work: David has a NULL salary, so his annual salary was NULL, his tax was 0, and C1 marked him INVALID. Eva has a hire date in the future and department 99, so her years of service was NULL, her department was 'Unknown Department', and C1 marked her INVALID. Without exception handling, one bad row would have stopped the whole SELECT with an error.

7. Challenges and what I would improve

The hardest part at the start was organising the work: creating the GitHub repository, making the folders with the exact names, and saving every file in the right place. In SQL Developer I learned the difference between F5 (Run Script, for PL/SQL blocks and DBMS_OUTPUT) and F9 (Run Statement, for a clean result grid). When I checked my functions, the STATUS column was cut off with F5, and I also saw system functions (LOGMNR$...) because my connection uses a system account, so I filtered the query to show only my own functions. I also had to be careful that Notepad did not save my Markdown file as .txt. Next time I would add more validation rules to C1 (for example a maximum salary limit or checking that the name is not empty), add more test cases, and create my own non-system database user for the assignment.