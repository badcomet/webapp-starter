// Load plugins
const gulp = require('gulp');
const plugins = require('gulp-load-plugins')();

// Main paths
const source = './';
const destination = '../public/';

// JS libs & main file sources
const headerJS = [
    'js/app.js'
];

// Pack JS
gulp.task('pack:js', () => {
    return gulp.src(headerJS)
        .pipe(plugins.sourcemaps.init())
        .pipe(plugins.babel({
            presets: ['@babel/env']
        }))
        .pipe(plugins.concat('app.js'))
        .pipe(plugins.sourcemaps.write('./'))
        .pipe(gulp.dest(destination + 'js/'))
});

// Pack CSS
gulp.task('pack:css', () => {
    return gulp.src(source + 'scss/app.scss')
        .pipe(plugins.sourcemaps.init())
        .pipe(plugins.plumber())
        .pipe(plugins.sass())
        .pipe(plugins.csscomb())
        .pipe(plugins.cssbeautify())
        .pipe(plugins.sourcemaps.write('./'))
        .pipe(gulp.dest(destination + 'css/'));
});


// Minify css
gulp.task('minify:css', () => {
    return gulp.src(destination + 'css/app.css')
        .pipe(plugins.csso())
        .pipe(plugins.rename({
            suffix: '.min'
        }))
        .pipe(gulp.dest(destination + 'css/'));
});

// Manual tasks
gulp.task('build', ['pack:css', 'pack:js']);
gulp.task('prod', ['build', 'minify:css']);

// Watch sources and process
gulp.task('watch', () => {
    gulp.watch(source + 'scss/*.scss', ['pack:css']);
    gulp.watch(source + 'js/*.js', ['pack:js']);
});

// Default
gulp.task('default', ['build']);