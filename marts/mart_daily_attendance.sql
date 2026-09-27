WITH all_cross_data AS(
    select * from{{ref('int_all_cross_data')}}
)
,
sub_attendance AS(
    select * from{{ref('stg_attendance')}}
)
select
     ac."emp_id",
     ac."date",
     ac."year",
     ac."month",
     ac."day",
     ac."week",
     ac."name",
     ac."dept_name",
     ac."dept_id",
     (CASE WHEN 
      sa."earliest_work_time" IS NULL THEN NULL
      ELSE CONCAT(CAST(sa."date" AS VARCHAR), ' ', CAST(sa."earliest_work_time" AS VARCHAR)) 
      END)::VARCHAR AS "earliest_work_time",

      (CASE WHEN 
      sa."latest_work_time" IS NULL THEN NULL
      ELSE CONCAT(CAST(sa."date" AS VARCHAR), ' ', CAST(sa."latest_work_time" AS VARCHAR))
      END)::VARCHAR AS "latest_work_time",

      sa."sec_break_time",

      COALESCE(sa."gross_work_time",0)::BIGINT AS "gross_work_time",

      COALESCE(("gross_work_time" - "sec_break_time"),0)::BIGINT AS "actual_work_time"

      from all_cross_data as ac
left outer join sub_attendance as sa
on ac."emp_id" = sa."emp_id"
and ac."date" = sa."date"
