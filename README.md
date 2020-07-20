# -Pewlett-Hackard-Analysis-

# Analysis:
The data we are trying to determine is which of the current employees at Pwelett Hackard are eligible for retirement to determine what positions openings we will create based on this. In addition to this we also analyzed the data to find out how many employees and which ones are eligible for mentoring.

We started by building an ERD to understand the relationship between the data.

![Challenge7](https://github.com/lrovira/-Pewlett-Hackard-Analysis-/blob/master/EmployeeDB.png)


The first step was to sort out the data by separating the employees that are eligible for retirement, this is easier said than done. Because it can't just be filtered the by their date of birth, we need to make sure that they're currently active employees meaning people that still hold a position in the company. To do this we must connect the employee names with their job titles in the table. In this process we need to make sure to filter the date range and look for positions whose `to_date` is still undetermined meaning they are currently active. We saved these results into a new table named “Employees Retiring”, after this we “join” this newly created table with their job titles, using the same `to_date` filter but grouping them by title and selecting both the title itself and the title count. Finally, we can either move these results into a new table or use them/extract them as is.



    SELECT employees.*, 
    titles.title, titles.from_date, salaries.salary  
    INTO challenge1 FROM employees JOIN titles ON 
    employees.emp_no = titles.emp_no 
    JOIN salaries ON employees.emp_no = salaries.emp_no 
    WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31' 
    --AND titles.to_date = '9999-01-01' 
    ORDER BY employees.emp_no; 


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

We then determined employees who are eligible to participate in a mentorship program to be eligible to participate.

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

My recommendation to the company based on the collected data from the analysis is to find out a way to eliminate duplicate names on the list and avoid any discrepancies. By doing this we will be able to ensure that the job titles are accurate on each employee and we will be able to collect the data necessary to find out the job titles that need to be created. 
