-- 풀이1 : where절 서브쿼리를 이용한 풀이
-- AS를 where절에서는 사용 못하지만 Group by, having절에서는 사용 가능
/*
-- MAX earnings : 최고금액 받는 사람 여러명 나옴
SELECT months * salary AS earnings
     , name
FROM employee
WHERE months * salary = (SELECT MAX(months*salary) FROM employee)

108064 Anthony 
108064 Nancy 
108064 Patricia 
108064 Angela 
108064 Gregory
108064 Lillian 
108064 Evelyn 
*/
SELECT months * salary AS earnings
     , count(*)
FROM employee
WHERE months * salary = (SELECT MAX(months*salary) FROM employee)
GROUP BY months * salary


-- 풀이 2 : having절 서브쿼리를 이용한 풀이
SELECT months * salary AS earnings
     , count(*)
FROM employee
GROUP BY earnings
having earnings = (SELECT MAX(months*salary) FROM employee)
