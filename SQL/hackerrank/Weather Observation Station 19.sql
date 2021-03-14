/*
-- 변수 여러개일때, alias로 정리한 후 풀이하기
select min(LAT_N) as a
     , Max(LAT_N) as b
     , min(LONG_W) as c
     , Max(LONG_W) as d
     , round(sqrt(power(a-b,2) + power(c-d,2)),4)
*/

select round(sqrt(power(min(LAT_N)-Max(LAT_N),2) + power(min(LONG_W)-Max(LONG_W),2)),4)
from station

