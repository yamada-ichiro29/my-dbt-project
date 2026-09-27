WITH raw_attendance AS(
    SELECT * FROM read_csv('C:\勤怠テーブル一覧\attendance_table.csv')
)
    
 SELECT 
     "emp_id" :: VARCHAR AS "emp_id",
     "date" :: DATE AS "date",
     MIN("att_start_time"::TIME) AS "earliest_work_time",
     MAX("att_finish_time"::TIME) AS "latest_work_time",
     EXTRACT(EPOCH FROM MAX("break_time"::TIME))::BIGINT AS "sec_break_time",
     
    -- 滞在時間の計算(行の重複防止)

     SUM(date_diff('second', "att_start_time"::TIME, "att_finish_time"::TIME)) AS "gross_work_time"
     
 FROM raw_attendance
 GROUP BY 
     "emp_id",
     "date"
