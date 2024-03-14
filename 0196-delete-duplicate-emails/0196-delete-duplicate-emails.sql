# Write your MySQL query statement below
delete p2
from Person p1 join Person p2
on p1.email=p2.Email
and p1.id<p2.id