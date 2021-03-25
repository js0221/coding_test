# DO NOT write any select statement for this problem.
# case문을 먼저 써보고, SET에 넣어주기
/*
CASE WHEN sex = 'f' THEN 'm'
     ELSE 'f'
END
*/

UPDATE salary
SET sex = CASE WHEN sex = 'f' THEN 'm'
            ELSE 'f'
          END
