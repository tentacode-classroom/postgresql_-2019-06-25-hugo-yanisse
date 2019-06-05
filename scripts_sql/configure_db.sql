ALTER SYSTEM SET PORT = '1234';
ALTER SYSTEM SET work_mem = '50MB';

SELECT name, setting FROM pg_settings WHERE name='port';
SELECT name, setting FROM pg_settings WHERE name='work_mem';
