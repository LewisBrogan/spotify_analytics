{%- set columns = adapter.get_columns_in_relation(ref('stg_tracks')) -%}
with tracks as (
select
{%- for column in columns -%}
{% if loop.first %}
    {{ column.column }}
{% else %}
  , {{ column.column }}
{% endif %}
{%- endfor -%}
from {{ ref('stg_tracks') }}      
)

select
  *
from tracks
