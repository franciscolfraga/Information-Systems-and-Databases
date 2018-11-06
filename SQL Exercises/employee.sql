--1
SELECT employee.name AS employee_name, department.name AS department_name FROM employee, department WHERE employee.id_dep=department.id
SELECT employee.name AS employee_name, department.name AS department_name FROM employee JOIN department ON employee.id_dep=department.id

--2
SELECT department.name AS department_name, employee.name AS director_name FROM department JOIN employee ON employee.id=department.id_dir

--3
SELECT project.name AS project_name, department.name AS department_name FROM department JOIN project ON project.id_dep=department.id

--4
SELECT project.name AS project_name FROM department JOIN project ON project.id_dep=department.id AND department.id=1

--5
SELECT project.name AS project_name FROM department JOIN project ON project.id_dep=department.id AND department.name = 'Transports'

--6
SELECT employee.name AS employee_name, works.hours AS hours FROM works
        JOIN employee ON works.id_emp = employee.id
        JOIN project ON project.id = works.id_pro AND project.name = 'XPTO'

--7
SELECT employee.name AS employee_name, works.hours AS hours FROM works
        JOIN employee ON works.id_emp = employee.id
        JOIN project ON project.id = works.id_pro AND project.name = 'XPTO'
        ORDER BY works.hours DESC

--8
SELECT project.name AS project_name, COUNT(employee.id) FROM works
        JOIN employee ON works.id_emp = employee.id
        JOIN project ON project.id = works.id_pro
        GROUP BY project.name

--9
SELECT project.name AS project_name, SUM(works.hours) AS hours FROM works
        JOIN employee ON works.id_emp = employee.id
        JOIN project ON project.id = works.id_pro
        GROUP BY project.name

--10
SELECT employee.name AS employee_name , SUM(works.hours) AS hours FROM works
        JOIN employee ON works.id_emp = employee.id
        JOIN project ON project.id = works.id_pro
        GROUP BY employee.id

--11
SELECT employee.name AS employee_name, superior.name AS superior_name FROM employee
       LEFT JOIN employee AS superior
       ON employee.id_sup = superior.id

--12
SELECT employee.name AS employee_name, employee.salary , department.name AS department_name
      FROM employee JOIN department
      ON employee.id_dep = department.id

--13
SELECT department.name AS department_name, MAX(employee.salary) AS max_salary
      FROM employee JOIN department
      ON employee.id_dep = department.id
      GROUP BY department.name

--14
SELECT MAX(employee.salary) AS salary FROM employee

--15
SELECT MAX(employee.salary) - MIN(employee.salary) AS difference FROM employee

--16
SELECT employee.name AS employee_name, superior.name AS superior_name, MAX(employee.salary - superior.salary) AS difference
      FROM employee LEFT JOIN employee AS superior
      ON employee.id_sup = superior.id

--17
SELECT MAX(employee.salary - superior.salary) AS difference
      FROM employee LEFT JOIN employee AS superior
      ON employee.id_sup = superior.id

--18
SELECT department.name AS department_name
      FROM employee JOIN department
      ON employee.id_dep = department.id
      GROUP BY department.name
      HAVING AVG(employee.salary) >= 1300

--19
SELECT employee.name AS employee_name
      FROM employee JOIN department ON employee.id_dep = department.id
      JOIN works ON works.id_emp = employee.id
      JOIN project ON project.id = works.id_pro
      WHERE project.id_dep <> employee.id_dep
      GROUP BY employee.id

--20
SELECT employee.name AS employee_name
      FROM employee JOIN department ON employee.id_dep = department.id
      JOIN works ON works.id_emp = employee.id
      JOIN project ON project.id = works.id_pro
      WHERE project.id_dep = employee.id_dep
      GROUP BY employee.id

--21
SELECT employee.name AS employee_name
      FROM employee JOIN department ON employee.id_dep = department.id
      JOIN works ON works.id_emp = employee.id
      JOIN project ON project.id = works.id_pro
      WHERE project.id_dep = employee.id_dep AND
      1 = (SELECT COUNT(project.id_dep) FROM works JOIN project ON project.id = works.id_pro WHERE employee.id = works.id_emp)
      GROUP BY employee.id
