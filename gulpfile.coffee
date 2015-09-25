gulp        = require 'gulp'
source      = require 'vinyl-source-stream' # Throwing files from one build process to another.
browserify  = require 'browserify' # Which part of code depends on the other part and if it is loaded correctly.
watchify    = require 'watchify' # Automatically reload code.
reactify    = require 'coffee-reactify'
del         = require 'del'
stylus      = require 'gulp-stylus'
webserver   = require 'gulp-webserver'

gulp.task 'assets', =>
  gulp
    .src 'assets/**/*'
    .pipe gulp.dest 'build/'

gulp.task 'frontend', =>
  bundler = browserify
    entries: ['./src/scripts/app.coffee']
    transform: [reactify]
    extensions: ['.coffee']
    debug: true
    cache: {}
    packageCache: {}
    fullPaths: true

  bundler
    .bundle()
    .on 'error', console.log.bind(console, 'Browserify error')
    .pipe source 'app.js'
    .pipe gulp.dest './build'

gulp.task 'css', ->
  #Create index.css file from index.styl
  gulp
    .src 'src/style/index.styl'
    .pipe stylus()
    .pipe gulp.dest 'build/'
gulp.task 'clean', (done) ->
  del 'build/**/*', done

gulp.task 'build', gulp.series [
  'clean'
  gulp.parallel [
    'frontend'
    'assets'
    'css'
  ]
]

gulp.task 'watch', (done) ->
  gulp.watch [
    'src/**/*'
    'assets/**/*'
  ], gulp.series ['build']

gulp.task 'serve', ->
  gulp
    .src 'build'
    .pipe webserver
      livereload: true,
      open: true

gulp.task 'develop', gulp.series [
  'build'
  gulp.parallel [
    'watch'
    'serve'
  ]
]
