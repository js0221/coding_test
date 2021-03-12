/*
출력 : hecker id, names of haker
조건 : 1개 초과에서 full score 
정렬 : 챌린지수 내림차순, id 오름차순

1st. full score이 무엇인지
2nd. submission table에서 챌린지 id 확인 > chllanges table에서 레벨 확인 > Difficulty에서 full score 확인
>>> 옆으로 표를 그린다는 느낌...
*/

select h.hacker_id
     , h.name
from Submissions s
     Inner Join Hackers h ON s.hacker_id = h.hacker_id
     Inner Join Challenges c ON s.challenge_id = c.challenge_id
     Inner Join Difficulty d ON c.difficulty_level = d.difficulty_level
where s.score = d.score
group by h.hacker_id, h.name
-- 그룹단위로 묶어야되는데, 일단 출력이 hacker_id, name이니까 적어주고, 조건 having
having count(DISTINCT s.submission_id) > 1
order by count(DISTINCT s.submission_id) DESC, h.hacker_id
