--Challenge 1
SELECT employees.*, 
titles.title, titles.from_date, salaries.salary  
INTO challenge1 FROM employees JOIN titles ON 
employees.emp_no = titles.emp_no 
JOIN salaries ON employees.emp_no = salaries.emp_no 
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31' 
--AND titles.to_date = '9999-01-01' 
ORDER BY employees.emp_no; 


--Challenge 1.2
SELECT employees.*, 
titles.title, titles.from_date, salaries.salary  
INTO challenge1_2 FROM employees JOIN titles ON 
employees.emp_no = titles.emp_no 
JOIN salaries ON employees.emp_no = salaries.emp_no 
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31' 
AND titles.to_date = '9999-01-01' 
ORDER BY employees.emp_no;

SELECT * FROM challenge1_2
--Challenge1.3
SELECT title, COUNT(title) INTO Challenge1_3 FROM challenge1_2 GROUP BY title; 
SELECT * FROM challenge1_3; 

--Challenge Part 2: Mentorship Eligibility with out duplicates
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO challenge2
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND ti.to_date = ('9999-01-01')
ORDER BY e.emp_no;


--Challenge Part 2: Count before removing duplicates(3125)
SELECT count(*) INTO challenge2_1 FROM
challenge2;
	