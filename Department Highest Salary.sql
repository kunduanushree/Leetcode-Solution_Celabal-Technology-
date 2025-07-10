WITH RankedSalaries AS (
  SELECT
    e.name AS Employee,
    e.salary AS Salary,
    e.departmentId,
    RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
  FROM Employee e
)
SELECT
  d.name AS Department,
  r.Employee,
  r.Salary
FROM RankedSalaries r
JOIN Department d ON r.departmentId = d.id
WHERE r.rnk = 1;
