{{ config(materialized='table', unique_key='id') }}

SELECT
  id,
  event:user_id::INT AS user_id,
  event:action::STRING AS action,
  event:timestamp::TIMESTAMP AS event_time,
  inserted_at
FROM {{ source('raw', 'raw_events') }}
