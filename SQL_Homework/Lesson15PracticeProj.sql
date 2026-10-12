/*Execute SQL code to create an employee table named XYZ.employee with fields:
emp_id, f_name, l_name, job_id, salary, manager_id, dept_id
*/

Create Table if not Exists XYZemployee(
	emp_id INTEGER,
	f_name VARCHAR(255),
	l_name VARCHAR(255),
	job_id VARCHAR(255),
	salary Integer,
	manager_id Integer,
	dept_id Integer
)
;

select *
from XYZemployee x 

Insert Into XYZemployee(emp_id,f_name,l_name,job_id,salary,manager_id,dept_id)
Values ('101', 'John', 'Smith', 'JP123', '70000', '02', '30'),
	   ('102', 'Emily', 'Johnson', 'EN456', '80000', '03','40'),
	   ('103', 'Michael', 'Williams', 'MW789', '90000', '04', '20'),
	   ('104', 'Emma', 'Jones', 'EJ567', '75000', '02', '10'),
	   ('105', 'Calvin', 'Miller', 'CM345', '85000', '03', '30'),
	   ('106', 'Sophia', 'Davis', 'SD678', '95000', '04', '20'),
       ('107', 'Liam', 'Moore', 'LM901', '72000', '02', '40'),
       ('108', 'Olivia', 'Anderson', 'OA234', '87000', '03', '10'),
       ('109', 'William', 'Brown', 'WB567', '92000', '04', '30'),
       ('110', 'Ava', 'Taylor', 'AT890', '78000', '02', '20')
       ;

/*Execute SQL code to retrieve the first and last names of employees with a salary higher than Calvin. 
 Utilize joins to compare employee salaries
 */

Select e1.f_name, 
	  e1.l_name,
	  e1.salary,
	  e2.salary as c_salary
From XYZemployee e1
Inner join XYZemployee e2 on e2.f_name = 'Calvin'
Where e1.salary > e2.salary;


/*Execute SQL code to display employee ID and last name of those with a salary greater than the average salary of all employees. 
 Utilize subqueries to calculate the average.
 */

Select xe.emp_id, 
       xe.l_name,
       xe.salary,
       (SELECT AVG(salary) FROM XYZemployee) as avg_salary
From XYZemployee xe
Where salary > (
    SELECT AVG(salary) 
    FROM XYZemployee
    )
    ;
/*Execute SQL code to display employee ID and first name of those with a salary higher than the job_id - MW789, sorted by salary. 
 Utilize set operations to compare salaries with the job_id - MW789
 */

Select xe.emp_id,
       xe.f_name,
       xe.salary
 From XYZemployee xe   
 Except 
SELECT xe1.emp_id, 
       xe1.f_name,
       xe1.salary
FROM XYZemployee xe1
JOIN XYZemployee xe2 ON xe2.job_id = 'MW789'
WHERE xe1.salary <= xe2.salary
ORDER BY salary ASC;


/*Execute SQL code to display the top three earners' first names, employee IDs, and salaries. 
 Utilize a subquery in the FROM  clause to identify the top earners based on salary and a join to retrieve full employee details.
*/

SELECT 
    xe.f_name AS first_name,
    xe.emp_id AS employee_id,
    xe.salary
FROM XYZemployee xe
JOIN (
    SELECT DISTINCT salary
    FROM XYZemployee
    ORDER BY salary DESC
    LIMIT 3
) top_salaries 
    ON xe.salary = top_salaries.salary;



