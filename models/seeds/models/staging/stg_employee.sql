WITH emp AS(
    SELECT 
     "emp_id" :: VARCHAR AS "emp_id",
     "sei" :: VARCHAR AS "sei",
     "mei" :: VARCHAR AS "mei",
     "dept_id" ::  VARCHAR AS "dept_id"
    FROM {{ ref('employee_table')}}
)
,
dept as(
    SELECT 
     "dept_id" :: VARCHAR AS "dept_id",
     "dept_name" :: VARCHAR AS "dept_name" 
    FROM {{ ref('department_table')}}
)

-- 部署が存在していない従業員の歯抜けを防止

SELECT 
     emp."emp_id" :: VARCHAR AS "emp_id",
     (CONCAT(emp."sei", emp."mei"))::VARCHAR AS "name" ,
     COALESCE(dept."dept_id"::VARCHAR,'000') AS "dept_id",
     COALESCE(dept."dept_name"::VARCHAR,'部署なし') AS "dept_name"
FROM emp
LEFT OUTER JOIN dept
on emp."dept_id" = dept."dept_id"
