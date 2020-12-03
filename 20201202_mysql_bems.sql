

INSERT employees_1 (emp_no,age,family,id_number)
VALUES(999999,'100','10','9999999')


INSERT employees_1 (emp_no,age,family,id_number)
VALUES(999991,'100','10','9999999')


INSERT employees_1 (emp_no,age,family,id_number)
VALUES(999992,'100','10','9999999')

UPDATE employees_1
SET age = '42'
WHERE emp_no = 22222

DELETE FROM employees_1 WHERE EMP_NO = 10000

SELECT MAX(EMP_NO) FROM employees

DELETE FROM employees_1 WHERE emp_no <= 99999

SELECT A.emp_no, B.emp_no
FROM employees_1 A LEFT OUTER JOIN employees B
ON A.emp_no = B.emp_no

SELECT A.emp_no, B.emp_no
FROM employees_1 A RIGHT OUTER JOIN employees B
ON A.emp_no = B.emp_no