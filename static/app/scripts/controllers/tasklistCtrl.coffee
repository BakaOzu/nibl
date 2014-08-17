'use strict'

angular.module('niblApp').controller 'tasklistCtrl', ($scope, taskService, $modal, timer) ->
  $scope.tasks = taskService.getList().$object
  $scope.interval = 'Все время' 

  $scope.isSelected = (task) ->
    return task.url is $scope.selectedTask.url if  'url' of $scope.selectedTask

  $scope.showDetails = (task) ->
    unless $scope.isSelected(task)
      $scope.alertIfUnchangedChanges()
      console.log 'here'
      $scope.sidebarMode = 'taskDetail'
      $scope.selectedTask = task

  

  $scope.setInterval = (interval) ->
    $scope.interval = interval


  $scope.startPomodoro = (task) ->
    timer.startCountdown(task)
    modalInstance = $modal.open
      templateUrl: "static/app/views/partials/pomo-timer.html"
      size: "lg"
      controller: 'pomoTimerCtrl'

