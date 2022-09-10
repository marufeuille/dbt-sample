SELECT
  "mito" AS place,
  mito_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "katsuura" AS place,
  katsuura_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "tokyo" AS place,
  tokyo_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "kofu" AS place,
  kofu_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "kumagaya" AS place,
  kumagaya_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "maebashi" AS place,
  maebashi_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "nagano" AS place,
  nagano_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "yokohama" AS place,
  yokohama_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs', 'weather') }}
UNION ALL
SELECT
  "utsunomiya" AS place,
  utsunomiya_sunshine_time AS sunshine_time,
  ymd
FROM {{ source('gcs','weather') }}

