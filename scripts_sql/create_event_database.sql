DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

#connection a la base git
\c github_events;

DROP TABLE IF EXISTS events;

--Création du type 'TYPE' du type ENUM. Pour recuperer le type (events)
CREATE TYPE TYPE AS ENUM ('PushEvent', 'CreateEvent', 'IssueCommentEvent', 'DeleteEvent', 'WatchEvent', 'ForkEvent', 'PullRequestEvent', 'GollumEvent', 'IssuesEvent', 'PullRequestReviewCommentEvent');

CREATE TABLE actor (
  id serial PRIMARY KEY,
  login varchar(45) NOT NULL,
  display_login varchar(45) NOT NULL,
  url varchar(255) NOT NULL,
  avatar_url varchar(255) NOT NULL
);

CREATE TABLE repository (
  id serial PRIMARY KEY,
  name varchar(75) NOT NULL,
  url varchar(255) NOT NULL
);

--- Création de la table parente ou figurera le json de actor et repository
CREATE TABLE events (
  id           serial PRIMARY KEY,
  created_at   TIMESTAMP    NOT NULL,
  type   TYPE NOT NULL,
  actor  INT REFERENCES actor (id) NOT NULL,
  repository   INT REFERENCES repository (id) NOT NULL
);

--- Table fille -> héritera de la table events
CREATE TABLE push_events (
  size		int,
  ref		varchar(255)
) INHERITS (events);

--- Table fille -> héritera de la table events
CREATE TABLE issue_events (
  action	varchar(50)   NOT NULL,
  label		varchar(255),
  issue   varchar(50)   NOT NULL
) INHERITS (events);

--- Insertions de fausse données
INSERT INTO push_events(size, ref) VALUES (4, 'refs/heads/master');
INSERT INTO issue_events(action, label, issue) VALUES ('edited','The optional label that was added or removed from the issue.','open');
INSERT INTO actor(login, display_login, url, avatar_url) VALUES ('Malcolm', '07Malcolm', 'http://url', '/avatar/url');
INSERT INTO repository(name,url) VALUES ('champions_project','https://github.com/tentacode-classroom/postgresql_-2019-06-25-hugo-yanisse');
INSERT INTO event(created_at, type, actor, repository) VALUES ('2019-05-07T04:00:00Z', 'PushEvent','1','1');
