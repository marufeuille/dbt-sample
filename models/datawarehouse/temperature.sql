SELECT
  "mito" AS place,
  "茨城" AS prefecture,
  mito_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "katsuura" AS place,
  "千葉" AS prefecture,
  katsuura_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "tokyo" AS place,
  "東京" AS prefecture,
  tokyo_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "kofu" AS place,
  "山梨" AS prefecture,
  kofu_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "kumagaya" AS place,
  "埼玉" AS prefecture,
  kumagaya_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "maebashi" AS place,
  "群馬" AS prefecture,
  maebashi_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "nagano" AS place,
  "長野" AS prefecture,
  nagano_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "yokohama" AS place,
  "神奈川" AS prefecture,
  yokohama_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}
UNION ALL
SELECT
  "utsunomiya" AS place,
  "栃木" AS prefecture,
  utsunomiya_avr_tmp AS temperature,
  ymd
FROM {{ source('gcs','weather') }}

