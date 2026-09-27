WITH calendar as(
    SELECT * FROM {{ ref('stg_calendar')}}
)
,
employee as(
    SELECT * FROM {{ ref('stg_employee')}}
)

SELECT
      c."date",
      c."year",
      c."month",
      c."day",
      c."week",
      e."emp_id",
      e."name",
      e."dept_id",
      e."dept_name"
FROM calendar as c
CROSS JOIN employee as e