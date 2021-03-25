# 풀이 1. DELETE & 서브쿼리 
/* 
1. 서브쿼리 : from이나 where [=, in, not in] 등과 같이 써줌

2. 풀이방법 : 구해야하는 서브쿼리의 테이블을 먼저 써주고, 나머지를 완성한다.
SELECT Email, MIN(ID)
FROM Person
GROUP BY Email

3. delete from where in / not in
delete from __ 
where in 이면, in 다음에 오는 것을 다 지움
where  not in이면, not in 다음에 오는 것은 킵하고 나머지를 지움
*/

DELETE FROM Person
WHERE Id NOT IN
(
SELECT sub.min_id
FROM(
SELECT Email, MIN(ID) AS min_id
FROM Person
GROUP BY Email
) sub
)

# 풀이 2. DELETE & INNER JOIN
/*
1. DELETE & INNER JOIN
DELETE와 JOIN을 같이 사용할 경우,
원하는 테이블만 삭제하기 위하여
DELETE와 FROM 사이에 테이블 명을 적어서 삭제 할 수 있다.

2. 테이블이 하나일때, self join으로 테이블을 활용할 수 있다

3. SELECT 문으로 한번 써보고 DELETE로 바꿔주기

SELECT *
FROM Person p1
     INNER JOIN Person p2 ON p1.Email = p2.Email
     
p1.id  p1.email          p2.id  p2.email 
1      john@example.com  1      john@example.com
1      john@example.com  3      john@example.com 
2      bob@example.com   2      bob@example.com 
3      john@example.com  1      john@example.com
3      john@example.com  3      john@example.com

3. WHERE p1.Id > p2.Id 인 경우는
3      john@example.com  1      john@example.com

4. DELETE
DELETE p1을 하면 p1 테이블 id가 3인 데이터를 지움
DELETE p2를 하면 p2 테이블 id가 1인 데이터를 지워서 2, 3만 남음
*/

DELETE p1
FROM Person p1
     INNER JOIN Person p2 ON p1.Email = p2.Email
WHERE p1.Id > p2.Id
