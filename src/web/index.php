<?php

// Require dependendies
$loader = require_once __DIR__.'/../vendor/autoload.php';
$loader->addPsr4('Site\\', __DIR__.'/../components/');

// Init Silex
$app = new Silex\Application();
$app['debug'] = true;

// Services
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/../views',
));

// Connexion to the database
$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
    'db.options' => array (
        'driver'    => 'pdo_mysql',
        'host'      => 'localhost',
        'dbname'    => 'pasolini',
        'user'      => 'root',
        'password'  => 'root',
        'charset'   => 'utf8'
    ),
));
$app['db']->setFetchMode(PDO::FETCH_OBJ);

// Create routes
$app
    ->get('/', function() use ($app)
    {
        return $app['twig']->render('pages/home.twig');
    })
    ->bind('home');

$app
    ->get('/article-1', function() use ($app)
    {
        $data = array();

        $moviesModel = new Site\Models\Movies($app['db']);
        $data['movies'] = $moviesModel->getAll();

        return $app['twig']->render('pages/article-1.twig', $data);
    })
    ->bind('article-1');

$app
    ->get('/article-2', function() use ($app)
    {
        return $app['twig']->render('pages/article-2.twig');
    })
    ->bind('article-2');


// Run Silex
$app->run();
