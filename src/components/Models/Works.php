<?php

namespace Site\Models;

class Works
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
                works
        ');
        $works = $query->fetchAll();

        return $works;
    }

    public function getRows()
    {
        $query = $this->db->query('
            SELECT
                Count(id) AS total
            FROM
                works
        ');
        $nb_rows = $query->fetchAll();

        return $nb_rows;
    }

    public function getNbMovies()
    {
        $query = $this->db->query('
            SELECT
                Count(category) AS totalCategory
            FROM
                works
            WHERE
                category = "Film"
        ');
        $nb_movies = $query->fetchAll();

        return $nb_movies;
    }

    public function getNbNovels()
    {
        $query = $this->db->query('
            SELECT
                Count(category) AS totalCategory
            FROM
                works
            WHERE
                category = "Roman" OR category = "Essai"
        ');
        $nb_novels = $query->fetchAll();

        return $nb_novels;
    }

    public function getById($slug)
    {
        $prepare = $this->db->prepare('
        SELECT
            *
        FROM
            works
        WHERE
            slug = :slug
        LIMIT 1
        ');
        $prepare->bindValue('slug', $slug);
        $prepare -> execute();
        $work = $prepare->fetch();

        return $work;
    }

    public function getMovies()
    {
      $query = $this->db->query('
            SELECT
                *
            FROM
                works AS w
            LEFT JOIN
                categories AS cat
            ON
                w.id = cat.id_category
            WHERE
                w.category = "Film"
        ');
        $movies = $query->fetchAll();

        return $movies;
    }

    public function getNovels()
    {
      $query = $this->db->query('
            SELECT
                *
            FROM
                works AS w
            LEFT JOIN
                categories AS cat
            ON
                w.id = cat.id_category
            WHERE
                w.category = "Roman" OR w.category = "Essai"
        ');
        $novels = $query->fetchAll();

        return $novels;
    }

    public function getSubCategory($formData)
    {
      $prepare = $this->db->prepare('
            SELECT
                *
            FROM
                works AS w
            LEFT JOIN
                categories AS cat
            ON
                w.id = cat.id_category
            WHERE
                w.sub_categories = :sub_category
        ');
        $prepare->bindValue('sub_category', $formData['subject']);
        $prepare->execute();
        $categories = $prepare->fetchAll();

        return $categories;
    }

    public function getNovelsOrEssays($formData)
    {
        $prepare = $this->db->prepare('
            SELECT
                *
            FROM
                works AS w
            LEFT JOIN
                categories AS cat
            ON
                w.id = cat.id_category
            WHERE
                w.category = :category
        ');
        $prepare->bindValue('category', $formData['subject']);
        $prepare->execute();
        $novels = $prepare->fetchAll();

        return $novels;
    }

    public function sortedByAsc()
    {
        $query = $this->db->query('
            SELECT
                *
            FROM
                works 
            ORDER BY 
                score ASC

        ');
        $works = $query->fetchAll();

        return $works;
    }

    public function sortedByDsc()
    {
        $query = $this->db->query('
            SELECT
                *
            FROM
                works 
            ORDER BY 
                score DESC

        ');
        $works = $query->fetchAll();

        return $works;
    }

}