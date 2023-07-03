CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select case when (select count(distinct salary) from employee) >= n then a.salary else null end 
    from employee a
    where (select count(distinct salary) from employee where salary > a.salary) < n
    order by 1
    limit 1
  );
END
