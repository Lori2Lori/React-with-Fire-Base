gulp        = require 'gulp'
source      = require 'vinyl-source-stream' # Throwing files from one build process to another.
browserify  = require 'browserify' # Which part of code depends on the other part and if it is loaded correctly.
watchify    = require 'watchify' # Automatically reload code.
reactify    = require 'coffee-reactify'
del         = require 'del'

gulp.task 'assets', =>
  gulp
    .src 'assets/**/*'
    .pipe gulp.dest 'build/'

gulp.task 'frontend', =>
  bundler = browserify
    entries: ['./src/app.coffee']
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


  # bundler = watchify browserify
  #   entries: ['./src/app.coffee']
  #   transform: [reactify]
  #   extensions: ['.coffee']
  #   debug: true
  #   cache: {}
  #   packageCache: {}
  #   fullPaths: true
  #
  # build = (file) =>
  #   if file? then console.log "Recompiling #{file}"
  #   return bundler
  #     .bundle()
  #     .on 'error', console.log.bind(console, 'Browserify error')
  #     .pipe source 'main.js'
  #     .pipe gulp.dest './build'
  #
  # do build
  # bundler.on 'update', build

gulp.task 'clean', (done) ->
  del 'build/**/*', done

gulp.task 'build', gulp.series [
  'clean'
  gulp.parallel [
    'frontend'
    'assets'
  ]
]

gulp.task 'watch', (done) ->
  gulp.watch [
    'src/**/*'
    'assets/**/*'
  ], gulp.series ['build']

gulp.task 'develop', gulp.series [
  'build'
  'watch'
]
