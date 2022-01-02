{%- set columns = 
['songplays_id',
'track_id',
'track_name',
'track_duration',
'track_is_explicit',
'track_popularity',
'track_played_at',
'album_id',
'album_name',
'album_release_year',
'album_type',
'artist_name',
'artist_name_others',
'artist_id',
'artist_id_others',
'track_danceability',
'track_energy',
'track_key',
'track_loudness',
'track_mode',
'track_speechiness',
'track_acousticness',
'track_instrumentalness',
'track_liveness',
'track_valence',
'artist_popularity',
'artist_followers',
'artist_genre',
'artist_genre_others'] -%}

with song_plays as (
select
{%- for col in columns -%}
{% if loop.first %} 
    {{ col }}
{% else %}
  , {{ col }}
{% endif %}
{%- endfor -%}
from {{ ref('songplays') }}
)
select
  *
from song_plays
