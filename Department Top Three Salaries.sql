WITH RankedSalaries AS (
  SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary,
    DENSE_RANK() OVER (
      PARTITION BY e.departmentId
      ORDER BY e.salary DESC
    ) AS rank_in_dept
  FROM Employee e
  JOIN Department d ON e.departmentId = d.id
)
SELECT
  Department,
  Employee,
  Salary
FROM RankedSalaries
WHERE rank_in_dept <= 3;
