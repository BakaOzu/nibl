'use strict'

angular.module('niblApp').directive 'sidebar', ->
  restrict: 'E'
  templateUrl: 'static/app/views/partials/sidebar.html'
  controller: 'sidebarCtrl'


angular.module('niblApp').directive 'tagCloud', ->
  restrict: 'E'
  templateUrl: 'static/app/views/tagcloud.html'
  controller: 'tagCloudCtrl'
  

