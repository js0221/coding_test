-- packages를 p1, p2로 사용!!!

select s.name
from Friends f
     Inner Join Students s ON f.ID = s.ID
     Inner Join Packages p1 ON f.ID = p1.ID
     Inner Join Packages p2 ON f.Friend_ID = p2.ID
where p1.Salary < p2.Salary
ORDER BY p2.Salary
