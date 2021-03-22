-- POINT : 2개 이상 셀프 조인

SELECT DISTINCT l.Num AS ConsecutiveNums
FROM logs AS l
     INNER JOIN logs AS l_next ON l.id + 1 = l_next.id
     INNER JOIN logs AS l_next2 ON l.id + 2 = l_next2.id
     /* 
     조인 조건 : 앞에 있는 테이블의 ID + 1 == 뒤에 오는 ID
     출력 : select l.id, l.Num, l_next.Num, l_next2.Num으로 하면 숫자가 연속되는지 파악 가능
     >>> 3번 연속해야 되므로, 조인 2번 해줌
     */
WHERE l.Num = l_next.Num AND l.Num = l_next2.Num
