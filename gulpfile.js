var gulp = require('gulp'); // Build process.

var gutil = require('gulp-util'); // Console logging, debugging.

var source = require('vinyl-source-stream'); // Throwing files from one build process to another.

var browserify = require('browserify'); // Which part of code depends on the other part and if it is loaded correctly.

var watchify = require('watchify'); // Automatically reload code.

var reactify = require('reactify'); // Works in conjunction with browserify and converts jsx files into js.

var babelify = require("babelify");

gulp.task('default', function() {
  var bundler = watchify(browserify({
    entries: ['./src/app.jsx'],
    transform: [reactify, babelify],
    extensions: ['.jsx'],
    debug: true,
    cache: {},
    packageCache: {},
    fullPaths: true
  }));

  function build(file) {
    if (file) gutil.log('Recompiling ' + file);
    return bundler
      .bundle()
      .on('error', gutil.log.bind(gutil, 'Browserify error'))
      .pipe(source('main.js'))
      .pipe(gulp.dest('./build'));
  };
  build();
  bundler.on('update', build)

});
