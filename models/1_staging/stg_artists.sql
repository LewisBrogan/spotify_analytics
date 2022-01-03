{%- set columns = 
['artist_rank',
'artist_id',
'artist_name',
'artist_popularity',
'artist_followers',
'artist_genre',
'artist_genre_others'] -%}

with artists as (
select
{%- for col in columns -%}
{% if loop.first %}
    {{ col }}
{% else %}
  , {{ col }}
{% endif %}
{%- endfor -%}
from {{ ref('top_artists') }}
)
select
  *
from artists