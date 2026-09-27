SELECT
 "date" :: DATE AS "date",
 "year" :: VARCHAR AS "year",
 "month" :: VARCHAR AS "month",
 "day" :: VARCHAR AS "day",
 "week" :: VARCHAR AS "week"
FROM read_csv('C:\勤怠テーブル一覧\calendar_table.csv')