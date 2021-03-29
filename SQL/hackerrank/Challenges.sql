-- 풀이1
/*
1. hacker_id별로 challenge 개수 센다
2. #challenge가 max 이면, id 순서로 정렬
3. #challenge가 max 아니고, 중복이면, 제외
>>> groupby의 조건을 사용 >>> having
*/
SELECT hackers.hacker_id
     , hackers.name
     , count(*) challenges_created
FROM Challenges
     INNER JOIN Hackers ON Challenges.hacker_id = Hackers.hacker_id
GROUP BY hackers.hacker_id, hackers.name

-- having 마지막에 생각 : 서브쿼리에서 MAX 이거나 1인 경우만 가져욤
HAVING challenges_created = (SELECT MAX(challenges_created)
                             FROM (
                             -- 해커id별로 challenges 개수                               
                                   SELECT hacker_id
                                        , COUNT(*) AS challenges_created
                                   FROM Challenges
                                   GROUP BY hacker_id
                            ) sub)
OR challenges_created IN (SELECT challenges_created
                             FROM (
                                   SELECT hacker_id
                                        , COUNT(*) AS challenges_created
                                   FROM Challenges
                                   GROUP BY hacker_id
                            ) sub
                            GROUP BY challenges_created
                            HAVING count(*) = 1)
ORDER BY challenges_created DESC, hacker_id


-- 풀이2 : with문 사용
/* WITH : 재사용이 가능한 테이블, 반복적인 서브쿼리를 대신할 수 있다
   풀이1에서 GROUP BY, count 연산이 3번 반복됨, 같은 연산 여러번 비효율적 */
WITH counter AS(
    SELECT hackers.hacker_id
         , hackers.name
         , COUNT(*) AS challenges_created
    FROM Challenges
         INNER JOIN Hackers ON challenges.hacker_id = Hackers.hacker_id
    GROUP BY hackers.hacker_id, hackers.name
)

SELECT counter.hacker_id
     , counter.name
     , counter.challenges_created
FROM counter
WHERE challenges_created = (SELECT MAX(challenges_created) FROM counter)
OR challenges_created IN (SELECT challenges_created
                          FROM counter
                          GROUP BY challenges_created
                          HAVING count(*) = 1)
ORDER BY counter.challenges_created DESC, counter.hacker_id
