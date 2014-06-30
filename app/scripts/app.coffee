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
  .constant('FIREBASE_URL', 'https://burning-fire-9586.firebaseio.com/')
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/project-list.html'
        controller: 'projectListCtrl'
      .when '/events',
        templateUrl: 'views/events.html'
        controller: 'eventListCtrl'
      # .when 'agenda',
      #   templateUrl: 'views/agenda.html'
      #   $controller: 'agendaCtrl'
      .otherwise
        redirectTo: '/'






