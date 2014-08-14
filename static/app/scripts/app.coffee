'use strict'

angular.module('niblApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.bootstrap',
    'restangular',
    'ngTagsInput',
  ])
  .config ($interpolateProvider) -> 
      $interpolateProvider.startSymbol '[['
      $interpolateProvider.endSymbol ']]'
  .run ($http, $cookies) ->
    $http.defaults.headers.common['X-CSRFToken'] = $cookies['csrftoken'] 
  .config (RestangularProvider) ->
    RestangularProvider.setRestangularFields selfLink: 'url'
    RestangularProvider.addResponseInterceptor (data, operation, what, url, response, deferred) ->
      if operation is 'getList'
        return data.results
      return data
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'static/app/views/tasklist.html'
        controller: 'tasklistCtrl'
      .when '/events',
        templateUrl: 'static/app/views/events.html'
        controller: 'eventListCtrl'
      # .when 'agenda',
      #   templateUrl: 'static/app/views/agenda.html'
      #   $controller: 'agendaCtrl'
      .otherwise
        redirectTo: '/'