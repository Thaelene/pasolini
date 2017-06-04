<?php

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Validator\Constraints\Length;


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

use Silex\Provider\FormServiceProvider;

$app->register(new Silex\Provider\FormServiceProvider());
$app->register(new Silex\Provider\TranslationServiceProvider());
$app->register(new Silex\Provider\ValidatorServiceProvider());
$app->register(new Silex\Provider\LocaleServiceProvider());

// Create routes
$app
    ->get('/', function() use ($app)
    {
        $data = array();

        $worksModel = new Site\Models\Works($app['db']);
        $data['works'] = $worksModel->getAll();
        $data['nb_rows'] = $worksModel->getRows();
        $data['nb_movies'] = $worksModel->getNbMovies();
        $data['nb_novels'] = $worksModel->getNbNovels();

        return $app['twig']->render('pages/home.twig', $data);
    })
    ->bind('home');

$app
    ->get('/work/{slug}', function($slug) use ($app)
    {
        $data = array();

        $worksModel = new Site\Models\Works($app['db']);
        $data['work'] = $worksModel->getById($slug);


         if(!$data['work'])
        {
            $app->abort(404);
        }

        return $app['twig']->render('pages/work.twig', $data);
    })
    ->assert('slug', '\w[\w]*(?:-\w+)*')
    ->bind('work');

$app
    ->match('/filmographie', function(Request $request) use ($app)
    {

        $data = array();
        
        $worksModel = new Site\Models\Works($app['db']);
        $data['work'] = $worksModel->getAll();

        $formBuilder = $app['form.factory']->createBuilder();

        $formBuilder->setMethod('post');
        $formBuilder->setAction($app['url_generator']->generate('filmography'));

        $formBuilder->add(
            'subject',
            ChoiceType::class,
            array(
                'label' => 'Catégorie souhaitée',
                'required' => true,
                'choices' => array(
                    'Trilogie de la vie' => 'trilogie_de_la_vie',
                    'Trilogie antique' => 'trilogie_antique',
                    'Trilogie romaine' => 'trilogie_romaine',
                    'Documentaire' => 'documentaire',
                    'Religion' => 'religion',
                    'Autres' => 'autres',
                )
            )
        );

        $formBuilder->add(
            'submit', 
            SubmitType::class,
            array(
                'label' => 'Valider'
            )
        );

        $form = $formBuilder->getForm();
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $formData = $form->getData();

            $worksModel = new Site\Models\Works($app['db']);
            $data['work'] = $worksModel->getSubCategory($formData);
             
        }


        $data['filmography_form'] = $form->createView();

        return $app['twig']->render('pages/filmography.twig', $data);
    })
    ->bind('filmography');

$app
    ->get('/article-2', function() use ($app)
    {

        

        return $app['twig']->render('pages/article-2.twig', $data);
    })
    ->bind('article-2');


// Run Silex
$app->run();
