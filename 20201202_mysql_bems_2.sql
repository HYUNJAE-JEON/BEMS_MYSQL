SELECT * FROM employees


SELECT emp_no, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1956-12-31'
# select from where 가 쿼리문의 기본 and 까지
# emp_no 는 필드명을 가져오는 것이다.
# employees는 남성,여성,입사일

SELECT 
FROM
WHERE
AND

SELECT emp_no, birth_date, first_name, last_name
FROM employees
WHERE birth_date IN ('1959-12-03', '1955-01-21', '1959-08-19')
ORDER BY birth_date DESC

SELECT emp_no, birth_date, first_name, last_name
FROM employees
WHERE birth_date IN ('1959-12-03', '1955-01-21', '1959-08-19')
AND birth_date BETWEEN '1956-01-01' AND '1959-12-31'
ORDER BY birth_date DESC

SELECT first_name
FROM employees
WHERE first_name LIKE '%M%'

TABLE employees
TABLE departments
TABLE dept_manager
TABLE dept_emp
TABLE titles
TABLE salaries

# A에 emp_no 와 B의 emp_no를 비교해서 B의 부서번호를 가져온다.

SELECT * FROM salaries

SELECT A.emp_no, A.first_name, A.last_name, B.dept_no, C.dept_name
FROM employees A, dept_emp B, departments C
WHERE A.emp_no = B.emp_no
AND B.dept_no = C.dept_no
AND A.emp_no = 10001

SELECT A.emp_no, A.first_name, A.last_name, D.title
FROM employees A, dept_emp B, departments C, titles D
WHERE A.emp_no = D.emp_no
AND A.emp_no = 10001

SELECT A.emp_no, A.first_name, A.last_name, B.salary
FROM employees A, salaries B
WHERE A.emp_no = B.emp_no
AND A.emp_no = 10002

SELECT A.emp_no, CONCAT(A.first_name,' ' ,A.last_name) AS NAME,
		B.salary, B.from_date, B.to_date
FROM employees A, salaries B
WHERE A.emp_no = B.emp_no
AND A.emp_no = 100002

SELECT emp_no, SUM(salary)
FROM salaries
WHERE emp_no IN (10001,10002)
GROUP BY emp_no

# 타켓팅 테이블을 불러온 뒤에 부가적인 테이블에서 정보를 불러온다.

SELECT A.emp_no, SUM(salary), CONCAT(B.FIRST_NAME,' ',B.LAST_NAME) AS NAME
FROM salaries A, employees B
WHERE A.emp_no = 100002
AND A.emp_no = B.emp_no

# IN절

SELECT A.emp_no, SUM(salary), CONCAT(B.FIRST_NAME,' ',B.LAST_NAME) AS NAME
FROM salaries A, employees B
WHERE B.emp_no IN (100002, 100001, 100003)
AND A.emp_no = B.emp_no
GROUP BY A.emp_no

SELECT SUBSTRING(from_date,1,4), SUM(salary)
FROM salaries
SELECT SUBSTRING(from_date,1,4) AS YEAR, SUM(salary) AS year_sum
FROM salaries
GROUP BY SUBSTRING(from_date,1,4)

SELECT A.emp_no, SUM(salary), CONCAT(B.FIRST_NAME,' ',B.LAST_NAME) AS NAME
FROM salaries A, employees B (SELECT emp_no FROM salaries WHERE salary > 40000)
WHERE A.emp_no = 100002
AND A.emp_no = B.emp_no
