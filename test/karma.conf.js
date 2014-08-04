module.exports = function(config) {
  return config.set({
    basePath: '../',
    frameworks: ['jasmine'],
    files: [
            'bower_components/angular/angular.js',
            'bower_components/angular-mocks/angular-mocks.js',
            'bower_components/angular-animate/angular-animate.js',
            'bower_components/angular-cookies/angular-cookies.js',
            'bower_components/angular-resource/angular-resource.js',
            'bower_components/angular-route/angular-route.js',
            'bower_components/angular-sanitize/angular-sanitize.js',
            'bower_components/angular-touch/angular-touch.js',
            'app/scripts/**/*.coffee',
            'test/spec/**/*.coffee',
            'node_modules/sinon-1.10.2.js',
            "bower_components/firebase/firebase.js",
            "bower_components/firebase-simple-login/firebase-simple-login.js",
            "bower_components/angularfire/angularfire.js",
            "bower_components/angular-bootstrap/ui-bootstrap-tpls.js",
            ],
    exclude: [],
    port: 8080,
    logLevel: config.LOG_INFO,
    browsers: ['Chrome'],
    plugins: ['karma-chrome-launcher', 'karma-jasmine', 'karma-coffee-preprocessor'],
    autoWatch: true,
    singleRun: false,
    colors: true,
    preprocessors: {
      '**/*.coffee': ['coffee']
    }
  });
};