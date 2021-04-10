-- 풀이 1: SET
-- set @변수이름 := 0;
SET @hour := -1;
SELECT (@hour := @hour +1) as HOUR ,
        (SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME)=@hour) AS COUNT
FROM ANIMAL_OUTS
WHERE @hour < 23

-- 풀이 2. recursive
/*
with recursive 이름 as(
    select 초기값 as 변수        # 초기 sql
    union all                 # 유니온은 합치는 것
    select from where 반복조건  # 반복 수행할 sql
)

select * 
from ...
*/
with recursive time as (
    select 0 as h
    union all
    select h+1 from time where h < 23
)
select h, count(datetime) 
from time
    left join animal_outs on h = hour(datetime)
group by h
order by h;
