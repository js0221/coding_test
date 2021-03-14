/*
1. case문 사용

2.  조건
Root : P가 널이다
Leaf : N의 값이 P에 존재하지 않는다 > 두번째 테이블을 붙일때, NULL값이다.
Inner : else
*/

SELECT DISTINCT BST.N
     , CASE 
            WHEN BST.P IS NULL THEN 'Root'
            WHEN BST2.N IS NULL THEN 'Leaf'
            ELSE 'Inner'
      END
FROM BST
     LEFT JOIN BST BST2 ON BST.N = BST2.P
ORDER BY BST.N

