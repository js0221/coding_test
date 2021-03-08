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
