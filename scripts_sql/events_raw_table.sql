#connection a la base git
\c github_events;

DROP TABLE IF EXISTS events_raw;

#creation de la table 
CREATE TABLE events_raw (
  data_json		jsonb,           
);