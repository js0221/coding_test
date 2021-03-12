Select Distinct city
from Station
where Left(city, 1) not in('A', 'E', 'I', 'O', 'U')
OR Right(city, 1) not in('A', 'E', 'I', 'O', 'U')

-- Where city Not like 'A%'
