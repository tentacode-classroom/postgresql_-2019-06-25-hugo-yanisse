-- On vérifie tout d'abord si le role et la db est existante, si oui on l a supprime
DROP DATABASE IF EXISTS super_admin;
DROP ROLE IF EXISTS super_admin;

-- On fait de même pour le deuxieme utilisateur
DROP DATABASE IF EXISTS github_events;
DROP ROLE IF EXISTS github_events;

-- On crée ensuite le role super admin et sa db
CREATE ROLE super_admin LOGIN PASSWORD '12345' SUPERUSER;
CREATE DATABASE super_admin OWNER super_admin;

-- Après cela on attaque la création du deuxième utilisateur
CREATE ROLE github_events LOGIN PASSWORD '12345';
CREATE DATABASE github_events OWNER github_events;
ALTER DATABASE github_events OWNER TO github_events;
