/*
POINT
1. 조인 조건을 BETWEEN인 경우
2. SELECT CASE문
3. 여러가지 정렬 조건 순서
*/

/*
출력 : 이름 등급 점수
조건 : 7등급 이하 이름은 널
정렬 : 등급 순, 같은 등급이면 이름 알파벳순,
      7등급 이하는 널이므로 더이상 이름 알파벳으로 정렬 못하고 점수 오름차순으로 정렬
*/

-- 7등급 이하는 이름이 널이므로 case문 써준다
-- case >>> select에서 조건에 따라 출력하고 싶은 경우 사용
SELECT CASE WHEN g.grade < 8 THEN NULL ELSE s.name END AS name
     , g.grade
     , s.marks
FROM students AS s
     INNER JOIN grades AS g ON s.marks BETWEEN g.min_mark AND g.max_mark
     -- select *으로 조인하면 : id, 이름, 점수, 등급, 등급최소점수, 등급최대점수
ORDER BY g.grade DESC, name, s.marks
