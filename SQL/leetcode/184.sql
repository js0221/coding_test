/* 풀이1 : Inner Join*/
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


/* 풀이2 : 윈도우함수, 서브쿼리
groupby를 window function의 partition을 사용하여 풀이
SELECT에서 사용한 연산을 where절에서 바로 사용할 수 없기 때문에, 서브쿼리를 사용*/
/* Write your T-SQL query statement below */
SELECT ms.department
     , ms.name AS Employee
     , ms.salary
FROM (
    SELECT employee.name
         , employee.salary
         , department.name AS department
         , MAX(salary) OVER (PARTITION BY departmentid) max_salary
    FROM employee
         INNER JOIN department ON employee.departmentid = department.id
     ) ms
WHERE ms.salary = ms.max_salary
