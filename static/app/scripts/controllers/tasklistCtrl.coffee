'use strict'

angular.module('niblApp').controller 'tasklistCtrl', ($scope, taskService, $modal, timer) ->
  $scope.tasks = taskService.getList().$object
  $scope.interval = 'Все время'

  $scope.startPomodoro = (task) ->
    timer.startCountdown(task)
    modalInstance = $modal.open
      templateUrl: "static/app/views/partials/pomo-timer.html"
      size: "lg"
      controller: 'pomoTimerCtrl'


  $scope.setCurrentTask = (task) ->
    console.log task
    $scope.sidebarMode = 'taskDetail'
    $scope.currentTask = task

  $scope.isCurrent = (task) ->
    return task is $scope.currentTask


  $scope.setInterval = (interval) ->
    $scope.interval = interval

  $scope.openTaskCreationForm = ->
    $scope.sidebarMode = 'taskCreation'
    $scope.currentTask = {}
    beforeEditTask = {}

