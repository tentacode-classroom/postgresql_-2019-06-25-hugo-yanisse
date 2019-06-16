INSERT INTO repository (id, name, url)
    SELECT
	CAST(data_json->'repo'->>'id' AS integer),
	data_json->'repo'->>'name',
	data_json->'repo'->>'url'
    FROM events_raw
-- Fonction qui permet en cas de conflit de ne pas insérer les données et ainsi risquer de corrompre les données
    ON CONFLICT DO NOTHING
