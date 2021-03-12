select Truncate(sum(LAT_N), 4)
FROM station
where LAT_N>38.7880 and LAT_N<137.2345
-- Between A and B : 포함
