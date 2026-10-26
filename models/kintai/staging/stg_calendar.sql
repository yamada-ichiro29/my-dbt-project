   SELECT
   date :: DATE AS date,
   year :: VARCHAR AS year,
   month :: VARCHAR AS month,
   day :: VARCHAR AS day,
   week :: VARCHAR AS week,
   weekend_flg :: VARCHAR AS weekend_flg
   FROM {{ ref('calendar_table')}}
