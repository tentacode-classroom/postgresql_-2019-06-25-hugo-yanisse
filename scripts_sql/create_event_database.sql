DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

#connection a la base git
\c github_events;

DROP TABLE IF EXISTS events;

CREATE TABLE events (
  id           varchar(255),
  created_at   varchar(255),
  repository   varchar(255),
  type		   varchar(255),
  actor		   varchar(255)
);

CREATE TABLE push_events (
  size		int,
  ref		varchar(255)
) INHERITS (events);

CREATE TABLE issue_events (
  action	varchar(255),
  label		varchar(255),
  issue     varchar(255),

) INHERITS (events);



