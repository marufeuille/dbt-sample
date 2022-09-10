SELECT
  "mito" AS place,
  mito_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "katsuura" AS place,
  katsuura_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "tokyo" AS place,
  tokyo_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "kofu" AS place,
  kofu_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "kumagaya" AS place,
  kumagaya_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "maebashi" AS place,
  maebashi_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "nagano" AS place,
  nagano_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "yokohama" AS place,
  yokohama_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "utsunomiya" AS place,
  utsunomiya_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}

