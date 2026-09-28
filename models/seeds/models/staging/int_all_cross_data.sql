WITH calendar as(
    SELECT 
     "date",
     "year",
     "month",
     "day",
     "week"
    FROM {{ ref('stg_calendar')}}
)
,
employee as(
    SELECT 
     "emp_id",
     "name",
     "dept_id",
     "dept_name"
    FROM {{ ref('stg_employee')}}
)

-- 直積で日付データと従業員データの全ての組み合わせを出す

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