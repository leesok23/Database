-- Please write a DELETE statement and DO NOT write a SELECT statement.
delete a
from person a, person b
where a.email = b.email and a.id > b.id
