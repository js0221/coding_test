{\rtf1\ansi\ansicpg949\cocoartf2578
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset129 AppleSDGothicNeo-Regular;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- group by : 
\f1 \'b0\'b0\'c0\'ba
\f0  
\f1 \'b0\'aa\'c0\'ba
\f0  
\f1 \'b9\'ad\'be\'ee\'c1\'d8\'b4\'d9
\f0 \
-- having : group by
\f1 \'b8\'a6
\f0  
\f1 \'bb\'e7\'bf\'eb\'c7\'d1
\f0  
\f1 \'b0\'e1\'b0\'fa\'b9\'b0\'c0\'bb
\f0  
\f1 \'b0\'a1\'c1\'f6\'b0\'ed
\f0  
\f1 \'bf\'ac\'bb\'ea\'c7\'cf\'b0\'ed
\f0  
\f1 \'bd\'cd\'c0\'bb
\f0  
\f1 \'b6\'a7
\f0  
\f1 \'bb\'e7\'bf\'eb
\f0 \
/*\
select Email\
      ,Count(Id) AS cnt\
from Person\
group by Email\
\
|-------|-------|\
|Email  |cnt    |\
|-------|-------|\
|a@b.com|2      |\
|c@d.com|1      |\
|-------|-------|\
*/\
\
-- sol1\
select Email\
from Person\
group by Email\
having count(ID) >= 2\
\
\
-- sol2\
/*\
select Email\
from\
(\
    select Email, count(Email) as num\
    from Person\
    group by Email\
) as statistic\
where num >= 2\
*/}
