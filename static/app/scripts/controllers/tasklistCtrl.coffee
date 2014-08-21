'use strict'

angular.module('niblApp').controller 'tasklistCtrl', ($scope, taskService, $modal, timer) ->
  # openDetailsView in sidebarCtrl 


  $scope.tasks = taskService.getList().$object
  $scope.interval = 'За интервал' 
  $scope.predicate = '-priority'

  $scope.isPredicate = (predicate) ->
    return $scope.predicate is predicate

  $scope.setInterval = (interval) ->
    $scope.interval = interval


  $scope.startPomodoro = (task) ->
    timer.startCountdown(task)
    modalInstance = $modal.open
      templateUrl: 'static/app/views/partials/pomo-timer.html'
      size: "lg"
      controller: 'pomoTimerCtrl'

