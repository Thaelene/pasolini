const gulp         = require( 'gulp' ),

    // Utility dependencies
    gulp_rename  = require('gulp-rename'),
    gulp_plumber = require ('gulp-plumber'),
    gulp_sourcemaps = require ('gulp-sourcemaps'),
    gulp_notify = require('gulp-notify'),
    gulp_connect = require ('gulp-connect')

    // CSS
    gulp_cssnano = require('gulp-cssnano'),
    gulp_autoprefixer = require ( 'gulp-autoprefixer' ),
    gulp_sass = require('gulp-sass'),

    // JS
    gulp_uglify  = require('gulp-uglify'),
    gulp_concat = require('gulp-concat'),

    // Images
    gulp_imagmin = require ('gulp-imagemin');

const config = {
    'dist': 'dist/',
    'src' : 'src/',
    'assets': 'dist/web/assets/'
}

// Running it by the command line : gulp
gulp.task( 'default', [ 'silex-composer', 'include', 'sass', 'css', 'javascript', 'twig', 'components', 'watch' ], function() {} );

// Moving src/web/.php file to dist/web/.php
gulp.task('include', function () {
  return gulp.src([
      config.src + 'web/.htaccess',
      config.src + 'web/index.php'
      ])
  .pipe(gulp.dest(config.dist + 'web'))
});


// Scss into css, minifies and rename it "sass.min.css"
gulp.task('sass', function () {
    return gulp.src([
        config.src + 'web/assets/styles/main.scss',
        // config.src + 'web/assets/styles/*/*.css'
    ])
    .pipe(gulp_plumber({
        errorHandler: gulp_notify.onError('SASS Error  <%= error.message %>')
    }))
    .pipe(gulp_sourcemaps.init())
    .pipe(gulp_sass({
        outputStyle: 'compressed'}).on('error', gulp_sass.logError))
    .pipe(gulp_sourcemaps.write())
    .pipe(gulp_autoprefixer({
    browsers: ['last 2 versions'],
    cascade: false
  }))
    .pipe(gulp_rename('sass.min.css'))
    .pipe(gulp.dest(config.assets + 'css'))
    .pipe(gulp_notify('SASS has been compiled !'))
});

gulp.task('css', function () {
    return gulp.src([
        config.src + 'web/assets/styles/*/*.css',
        config.assets + 'css/sass.min.css'
    ])
    .pipe(gulp_plumber({
        errorHandler: gulp_notify.onError('CSS Error  <%= error.message %>')
    }))
    .pipe(gulp_sourcemaps.init())
    .pipe( gulp_concat( 'style.min.css' ) )
    .pipe(gulp_sourcemaps.write())
    .pipe(gulp_autoprefixer({
    browsers: ['last 2 versions'],
    cascade: false
  }))
    .pipe(gulp.dest(config.assets + 'css'))
    .pipe(gulp_notify('CSS has been compiled !'))
});


// Concats and uglifies js files
gulp.task( 'javascript', function()
{
    return gulp.src( [
            config.src + 'web/assets/js/main.js',
            config.src + 'web/assets/js/**/*.js'
        ] )
        .pipe(gulp_plumber({
            errorHandler: gulp_notify.onError("JS Error: <%= error.message %>")
        }))
        .pipe(gulp_sourcemaps.init())
        .pipe( gulp_uglify() )
        .pipe( gulp_concat( 'main.min.js' ) )
        .pipe(gulp_sourcemaps.write())
        .pipe( gulp.dest(config.dist + 'web/assets/js' ) );
} );

// Minifies images
gulp.task('imagemin', function()
{
    return gulp.src(
        config.src + 'web/assets/img/*'
        )
        .pipe(gulp_imagmin())
        .pipe(gulp.dest(config.assets + 'img'))
        .pipe(gulp_notify('Images minified!'))
});


// Twig files from src/views are moved to dist 
gulp.task('twig', function () {
  return gulp.src(config.src + 'views/*/*')
  .pipe(gulp.dest(config.dist + 'views'))
});

//Move components into dist
gulp.task('components', function () {
  return gulp.src(config.src + 'components/*/*')
  .pipe(gulp.dest(config.dist + 'components'))
});

//Move composer files into dist
gulp.task('silex-composer', function () {
  return gulp.src([
      config.src + 'composer.json',
      config.src + 'composer.lock'
      ])
  .pipe(gulp.dest(config.dist))
});

//Move silex files into dist
gulp.task('silex', function () {
  return gulp.src(
      config.src + 'vendor/*'
      )
  .pipe(gulp.dest(config.dist + 'vendor'))
});

// Watches files change and launches relatives tasks
gulp.task( 'watch', function()
{
    gulp.watch(config.src + 'views/*/*.twig', [ 'twig' ] );
    gulp.watch(config.src + 'components/*/*', [ 'components' ] );
    gulp.watch([
        config.src + 'web/assets/styles/*/*.scss',
        config.src + 'web/assets/styles/*.scss',
        ], 
        [ 'sass' ] );
    gulp.watch([
        config.src + 'web/js/*.js',
        config.src + 'web/js/*/*.js'
        ], 
        [ 'javascript' ] );
    gulp.watch([
        config.src + 'web/.htaccess',
        config.src + 'web/index.php'
    ], 
    ['include']);
} );
