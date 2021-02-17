SELECT *
FROM cinema
-- WHERE mod(id, 2) = 1
WHERE id % 2 = 1
AND description != 'boring'
order by rating DESC
