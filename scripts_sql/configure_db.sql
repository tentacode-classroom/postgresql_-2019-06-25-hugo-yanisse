-- Modifie le port mis en place
ALTER SYSTEM SET PORT = '1234';
-- Modifie la mémoire attribuée
ALTER SYSTEM SET work_mem = '50MB';

-- Vérification du changement des valeurs
-- Tout d'abord avec le nouveau port configuré
SELECT name, setting FROM pg_settings WHERE name='port';
-- Ensuite avec la nouvelle mémoire attribuée aussi précèdement
SELECT name, setting FROM pg_settings WHERE name='work_mem';
