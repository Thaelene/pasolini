<?php

namespace Site\Models;

class Movies
{
    public $db;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function getAll()
    {
        $query = $this->db->query('
            SELECT
                *
            FROM
                movies
        ');
        $movies = $query->fetchAll();

        return $movies;
    }
}