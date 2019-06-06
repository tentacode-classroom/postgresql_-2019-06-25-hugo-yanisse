DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

#connection a la base git
\c github_events;

DROP TABLE IF EXISTS events;

CREATE TABLE events (
  id           serial PRIMARY KEY,
  created_at   TIMESTAMP    NOT NULL,
  repository   varchar(255) NOT NULL,
  type		     varchar(255) NOT NULL,
  actor		     varchar(255) NOT NULL
);

CREATE TABLE push_events (
  size		int,
  ref		varchar(255)
) INHERITS (events);

CREATE TABLE issue_events (
  action	varchar(50)   NOT NULL,
  label		varchar(255),
  issue   varchar(50)   NOT NULL,

) INHERITS (events);

INSERT INTO push_events(size, ref) VALUES (4, 'refs/heads/master');
INSERT INTO issue_events(action, label, issue) VALUES ('edited','The optional label that was added or removed from the issue.','open');



