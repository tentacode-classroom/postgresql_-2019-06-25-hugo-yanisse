INSERT INTO push_event (id, actor, repo, public, commits)
	SELECT
	CAST(data_json->>'id' AS BIGINT),
	CAST(data_json->'actor'->>'id' AS BIGINT),
	CAST(data_json->'repo'->>'id' AS BIGINT),
	CAST(data_json->'public' AS boolean),
	CAST(data_json->'payload'->>'size' AS INTEGER)
	FROM events_raw WHERE data_json->>'type'='PushEvent';


INSERT INTO issue_event (id, actor, repo, public, html_url, body)
	SELECT
	CAST(data_json->>'id' AS BIGINT),
	CAST(data_json->'actor'->>'id' AS BIGINT),
	CAST(data_json->'repo'->>'id' AS BIGINT),
	CAST(data_json->'public' AS boolean),
	data_json->'payload'->'issue'->>'html_url',
	data_json->'payload'->'issue'->>'body'
	FROM events_raw WHERE data_json->>'type'='IssuesEvent';
