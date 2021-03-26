/*
정규표현식
- 문자열에서 패턴을 찾아내는 규칙
- SQL, python, java 등 여러 언어에서 쓰임
- REGEXP ''
*/

/*
select distinct city
from station
where city LIKE 'a%'
or city LIKE 'e%'
or city LIKE 'i%'
or city LIKE 'o%'
or city LIKE 'u%'
*/

select distinct city
from station
where city REGEXP '^[aeiou].*'
