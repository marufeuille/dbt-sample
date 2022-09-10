WITH t1 AS (
  SELECT
    PARSE_DATE("%Y/%m/%d", ymd) AS ymd,
    prefecture,
    t.temperature
  FROM
    {{ ref('temperature') }} AS t
),
t2 AS (
  SELECT
    EXTRACT(YEAR FROM ymd) AS year,
    EXTRACT(month FROM ymd) AS month,
    prefecture,
    temperature
  FROM
    t1
),
t3 AS (
  SELECT
    year,
    month,
    prefecture,
    AVG(temperature) AS temperature
  FROM
    t2
  GROUP BY year, month, prefecture
),
t4 AS (
  SELECT
    year,
    prefecture,
    SUM(
      CASE
        WHEN month = 1 THEN temperature
        ELSE 0
      END
    ) AS jan_temp,
    SUM(
      CASE
        WHEN month = 2 THEN temperature
        ELSE 0
      END
    ) AS feb_temp,
    SUM(
      CASE
        WHEN month = 3 THEN temperature
        ELSE 0
      END
    ) AS mar_temp,
    SUM(
      CASE
        WHEN month = 4 THEN temperature
        ELSE 0
      END
    ) AS apr_temp,
    SUM(
      CASE
        WHEN month = 5 THEN temperature
        ELSE 0
      END
    ) AS may_temp,
    SUM(
      CASE
        WHEN month = 6 THEN temperature
        ELSE 0
      END
    ) AS jun_temp,
    SUM(
      CASE
        WHEN month = 7 THEN temperature
        ELSE 0
      END
    ) AS jul_temp,
    SUM(
      CASE
        WHEN month = 8 THEN temperature
        ELSE 0
      END
    ) AS aug_temp,
    SUM(
      CASE
        WHEN month = 9 THEN temperature
        ELSE 0
      END
    ) AS sep_temp,
    SUM(
      CASE
        WHEN month = 10 THEN temperature
        ELSE 0
      END
    ) AS oct_temp
    FROM t3
    GROUP BY year, prefecture
)
SELECT
  ine.planted_area,
  ine.region,
  ine.yield,
  t4.*
FROM
  {{ source('gcs', 'ine') }} AS ine
JOIN
  t4
ON
  ine.region = t4.prefecture
  AND ine.ymd = t4.year
