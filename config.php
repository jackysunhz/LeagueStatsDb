<?php

/**
 * Configuration for database connection
 * Need to change according to local user
 */

$host       = "localhost";
$username   = "jacky";
$password   = "lol";
$dbname     = "lol";
$dsn        = "mysql:host=$host;dbname=$dbname";
$options    = array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
              );