WITH emp AS(
    SELECT * FROM read_csv('C:\勤怠テーブル一覧\employee_table.csv')
)
,
dept as(
    SELECT * FROM read_csv('C:\勤怠テーブル一覧\department_table.csv')
)

SELECT 
        emp."emp_id" :: VARCHAR AS "emp_id",
        (CONCAT(emp."sei", emp."mei"))::VARCHAR AS "name" ,
        COALESCE(dept."dept_id"::VARCHAR,'000') AS "dept_id",
        COALESCE(dept."dept_name"::VARCHAR,'部署なし') AS "dept_name"
FROM emp
LEFT OUTER JOIN dept
on emp."dept_id" = dept."dept_id"
