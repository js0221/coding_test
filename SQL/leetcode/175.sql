-- Join
/*
select
from 테이블1
    Inner(or Left, right) Join 테이블2 ON 테이블1.키 = 테이블2.키
*/

select FirstName, LastName, City, State
from Person
    Left Join Address On Person.PersonID = Address.PersonID
    -- 정보가 없어도 출력하라고 했기 때문에 left join 사용, null
