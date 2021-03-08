
SELECT C.company_code
     , C.founder
     , COUNT(DISTINCT LM.lead_manager_code)
     -- 어떤 매니저를 카운트 할지 명시해 줘야 한다
     , COUNT(DISTINCT SM.senior_manager_code)
     , COUNT(DISTINCT M.manager_code)
     , COUNT(DISTINCT E.employee_code)
FROM Company C
     LEFT JOIN Lead_Manager LM ON C.company_code = LM.company_code
     -- 리드매니저가 없는 컴퍼니라도 출력을 해줘야 하므로 left join을 한다
     LEFT JOIN Senior_Manager SM ON LM.lead_manager_code = SM.lead_manager_code
     LEFT JOIN Manager M ON SM.senior_manager_code = M.senior_manager_code
     LEFT JOIN Employee E ON M.manager_code = E.manager_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code


/*
-- Group By 기준 컬럼 여러개
https://inf.run/sVX5

그룹화의 기준이 되는 컬럼은 반드시 SELECT에 적어줘야한다
역으로, 그룹화를 할때, SELECT에 적어주는 컬럼은 GROPU BY에 적어준다
*/

/*
Employee Table만 사용하면 예외를 찾지못하므로 주어진 테이블을 다 활용한다
이 문제는 정답은 맞게 나옴

-- 잘못된 풀이
select C.company_code,
     , C.founder
     , Count(DISTINCT E.lead_manager_code)
     , Count(DISTINCT E.senior_manager_code)
     , Count(DISTINCT E.employee_code)
from Company C
     Inner Join Employee E ON C.company_code = E.company_code
Group by C.company_code, C.founder
Order By C.company_code
*/
