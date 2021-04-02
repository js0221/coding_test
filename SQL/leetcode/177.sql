-- 풀이 1: CASE문, 서브쿼리
/* 
Tip. SELECT문으로 꺼내서 작성한 다음 FUNCTION에 넣기

1. LIMIT로 셀러리를 N개만 가져와서 가장 마지막에 있는 것을 선택
2. 근데, 케이스가 N보다 작을 경우 null을 준다
*/

CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
     SELECT CASE WHEN COUNT(sub.Salary) < N THEN NULL
                 ELSE MIN(sub.Salary)
            END
     FROM(
          SELECT DISTINCT Salary
          FROM Employee
          ORDER BY Salary DESC
          LIMIT N
          ) sub
  );
END

-- 풀이 2: IF함수
/*
IF function : IF(condition, value_if_true, value_if_false)
풀이 1의 case를 if로 변경
*/

CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN
  RETURN (
     SELECT IF(COUNT(sub.Salary) < N, NULL, MIN(sub.Salary))
     FROM(
          SELECT DISTINCT Salary
          FROM Employee
          ORDER BY Salary DESC
          LIMIT N
          ) sub
  );
END


-- 풀이 3: LIMIT, OFFSET
