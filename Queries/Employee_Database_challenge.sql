--Join empolyees and titles table to create retirement titles table
SELECT e.emp_no, e.first_name, e.last_name,
	   t.title, t.from_date,t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
					first_name,
					last_name,
					title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

--create table to count retiring number for each title
SELECT COUNT(title) as count,title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--show retiring_titles table
SELECT * FROM retiring_titles;

--count total current retiring employees
SELECT COUNT(emp_no) FROM unique_titles;

--count current employees
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, de.to_date
INTO all_current_emp
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01') 
ORDER BY e.emp_no

--count current employee number
SELECT * FROM all_current_emp

--Create mentorship eligibility table 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name,e.last_name, e.birth_date,
	   de.from_date, de.to_date,
	   t.title
INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY e.emp_no;

--show mentor eligibility table
SELECT * FROM mentor_eligibility
--count number of mentors
SELECT COUNT(emp_no) FROM mentor_eligibility

--mentor information by title and department

--Create the mentor table with most recent titles and departments
SELECT e.emp_no, e.first_name,e.last_name, e.birth_date,
	   de.from_date, de.to_date,
	   t.title,
	   d.dept_name
INTO mentor_info
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE (t.to_date = '9999-01-01') 
AND (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY e.emp_no;

SELECT * FROM mentor_info

--Count of mentor breakdown for each title
SELECT COUNT(title) as mentor_count, title
FROM mentor_info
GROUP BY (title)
ORDER BY mentor_count DESC;

--Count of mentor breakdown for each title from each department
SELECT COUNT(title) as title_count, title, dept_name
INTO mentor_breakdown
FROM mentor_info
GROUP BY (title, dept_name)
ORDER BY dept_name, title_count DESC;

--Retiree information

--Count of retiree breakdown for each title
SELECT COUNT(title) as retire_count ,title
FROM unique_titles
GROUP BY title
ORDER BY retire_count DESC;

--create table for retiree department
SELECT DISTINCT ON (ut.emp_no) ut.emp_no, ut.title, d.dept_name
INTO retire_info
FROM unique_titles AS ut
INNER JOIN dept_emp AS de
ON (ut.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
ORDER BY ut.emp_no;

--Count of retiree breakdown for each title from each department
SELECT COUNT(title) as title_count, title, dept_name
INTO retiree_breakdown
FROM retire_info
GROUP BY (title, dept_name)
ORDER BY dept_name, title_count DESC;
