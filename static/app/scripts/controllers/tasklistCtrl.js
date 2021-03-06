// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  angular.module('niblApp').controller('tasklistCtrl', function($scope, taskService, $modal, timer) {
    $scope.tasks = taskService.getList().$object;
    $scope.interval = 'За интервал';
    $scope.predicate = '-priority';
    $scope.isPredicate = function(predicate) {
      return $scope.predicate === predicate;
    };
    $scope.setInterval = function(interval) {
      return $scope.interval = interval;
    };
    return $scope.startPomodoro = function(task) {
      var modalInstance;
      timer.startCountdown(task);
      return modalInstance = $modal.open({
        templateUrl: 'static/app/views/partials/pomo-timer.html',
        size: "lg",
        controller: 'pomoTimerCtrl'
      });
    };
  });

}).call(this);
