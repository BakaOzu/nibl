// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  angular.module('niblApp').controller('tasklistCtrl', function($scope, taskService, $modal, timer) {
    $scope.tasks = taskService.getList().$object;
    $scope.interval = 'Все время';
    $scope.startPomodoro = function(task) {
      var modalInstance;
      timer.startCountdown(task);
      return modalInstance = $modal.open({
        templateUrl: "static/app/views/partials/pomo-timer.html",
        size: "lg",
        controller: 'pomoTimerCtrl'
      });
    };
    $scope.setCurrentTask = function(task) {
      console.log(task);
      $scope.sidebarMode = 'taskDetail';
      return $scope.currentTask = task;
    };
    $scope.isCurrent = function(task) {
      return task === $scope.currentTask;
    };
    $scope.setInterval = function(interval) {
      return $scope.interval = interval;
    };
    return $scope.openTaskCreationForm = function() {
      var beforeEditTask;
      $scope.sidebarMode = 'taskCreation';
      $scope.currentTask = {};
      return beforeEditTask = {};
    };
  });

}).call(this);
