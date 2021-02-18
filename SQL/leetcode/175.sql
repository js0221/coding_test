SELECT FirstName, LastName, City, State
from Person
     left join Address On Person.PersonId = Address.PersonId
