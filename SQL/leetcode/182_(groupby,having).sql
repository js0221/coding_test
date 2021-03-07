-- group by : 같은 값은 묶어준다
-- having : group by를 사용한 결과물을 가지고 연산하고 싶을 때 사용
/*
select Email
      ,Count(Id) AS cnt
from Person
group by Email

|-------|-------|
|Email  |cnt    |
|-------|-------|
|a@b.com|2      |
|c@d.com|1      |
|-------|-------|
*/

-- sol1
select Email
from Person
group by Email
having count(ID) >= 2


-- sol2
/*
select Email
from
(
    select Email, count(Email) as num
    from Person
    group by Email
) as statistic
where num >= 2
*/
