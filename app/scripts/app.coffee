'use strict'

angular.module('niblApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'firebase',
    'ui.bootstrap'
  ])
  .config ($interpolateProvider) -> 
      $interpolateProvider.startSymbol '[['
      $interpolateProvider.endSymbol ']]'

  .run ($http, $cookies) ->
    $http.defaults.headers.common['X-CSRFToken'] = $cookies['csrftoken'] # don't fully get it
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/tasklist.html'
        controller: 'tasklistCtrl'
      .when '/events',
        templateUrl: 'views/events.html'
        controller: 'eventListCtrl'
      # .when 'agenda',
      #   templateUrl: 'views/agenda.html'
      #   $controller: 'agendaCtrl'
      .otherwise
        redirectTo: '/'
  .constant('FIREBASE_URL', 'https://burning-fire-9586.firebaseio.com/')






