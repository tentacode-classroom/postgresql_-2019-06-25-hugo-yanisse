<?php
// creation de l'objet pdo qui servira pour les renseignements de notre bdd
$connection = new \PDO(
    'pgsql:host=localhost;port=5433;dbname=github_events',
    'super_admin',
    '12345'
);

$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


// Liaison du Json a la bdd -> buffer etant le tableau de ligne
function addJsons(array $buffer)
{
    global $connection;

    $values = implode('), (', array_fill(0, count($buffer), '?'));

    $sql = "INSERT INTO events_raw(data_json) VALUES (".$values.")";

    $statement = $connection->prepare($sql);
    $statement->execute($buffer);
}

$jsonFilePath = sprintf('%s/../ressources/2019-05-15-20.json', __DIR__);

$handle = fopen($jsonFilePath, 'r');

$maxLinePerBatch = 10000;
$buffer = [];
// lis et fais tant que le nombre de ligne n'est pas égal a 0
while (false !== $line = fgets($handle)) {
    $buffer[] = $line;
    // on ajoute les lignes par 10 000
    // on passe le tableau à la fonction addJson -> puis on remet a zero le []
    if (count($buffer) >= $maxLinePerBatch) {
        addJsons($buffer);
        $buffer = [];
    }
}

// si il reste des lignes malgré le while on l'ajoute aussi dans le tableau.
if (!empty($buffer)) {
    addJsons($buffer);
}
