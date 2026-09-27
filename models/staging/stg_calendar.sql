SELECT
 "date" :: DATE AS "date",
 "year" :: VARCHAR AS "year",
 "month" :: VARCHAR AS "month",
 "day" :: VARCHAR AS "day",
 "week" :: VARCHAR AS "week"
FROM {{ ref('calendar_table')}}