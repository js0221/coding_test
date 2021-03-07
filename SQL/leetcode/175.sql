SELECT FirstName, LastName, City, State
from Person
     left join Address On Person.PersonId = Address.PersonId
-- 정보가 없어도 출력하라고 했기 때문에 left join 사용
