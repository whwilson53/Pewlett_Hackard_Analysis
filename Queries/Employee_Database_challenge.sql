--1--retirement_titles
SELECT  e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM titles t
INNER JOIN employees e ON t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no ASC

--2--unique_titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no ASC, rt.to_date DESC;

--3--retring_titles
SELECT COUNT(ut) as count, ut.title
INTO retiring_titles
FROM unique_titles ut
GROUP BY ut.title
ORDER BY count DESC

--4--metorship_eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no ASC

