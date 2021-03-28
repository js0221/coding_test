SELECT d.name AS department
     , e.name AS employee
     , e.salary
FROM employee e
     INNER JOIN (
        -- 부서별 highest salary 값
        SELECT departmentid, MAX(salary) AS max_salary
        FROM employee
        GROUP BY departmentid
        ) AS dh ON e.departmentid = dh.departmentid
                AND e.salary = dh.max_salary
     -- Department 조인 (부서이름)
     INNER JOIN department d ON d.id = e.departmentid
