/* TIP
1. SELECT문으로 꺼내서 작성한 다음 FUNCTION에 넣기
2. 조건이 하나일때, IF문 사용, 조건이 여러개일때, CASE문 사용
*/

-- 풀이 1: CASE문, 서브쿼리
/* 
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
/* 
<LIMIT>
LIMIT 가져올 개수
LIMIT START(시작은 0번부터), 가져올 개수

LIMIT N(0부터 시작이니까 1번부터 따지면 N+1번임), M개
== LIMIT N, OFFSET M
               
<사용자정의함수 - DECLARE, SET>
함수 선언시 사용하는 변수를 바로 연산에 사용할 수 없다.
BEGIN 안에 변수를 선언해야 한다 (DECLARE, SET)
*/
               
CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN
  DECLARE A INT;
  SET A = N-1;
  /*
  > DECLARE A를 안할 경우
  SET N= N-1
  LIMIT N, 1
  
  > OFFSET 사용할 경우
  LIMIT 1 OFFSET N
  */
  RETURN (
          SELECT DISTINCT Salary
          FROM Employee
          ORDER BY Salary DESC
          LIMIT A, 1
  );
END
