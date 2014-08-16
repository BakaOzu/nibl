'use strict'

angular.module('niblApp').controller 'tasklistCtrl', ($scope, taskService, $modal, timer) ->
  $scope.tasks = taskService.all
  $scope.interval = 'Все время'

  $scope.showDetails = (task) ->
    console.log 'here'
    console.log $scope.sidebarMode, $scope.sidebarMode, $scope.currentTask
    if $scope.sidebarMode is 'taskEdition' or $scope.sidebarMode is 'taskCreation' and $scope.currentTask
      console.log 'you have some unsaved changes'
      # toastr.warning 'you have some unsaved changes'       
    $scope.sidebarMode = 'taskDetail'
    $scope.currentTask = task

  $scope.isCurrent = (task) ->
    return task.url is $scope.currentTask.url if  'url' of $scope.currentTask

  $scope.setInterval = (interval) ->
    $scope.interval = interval


  $scope.openTaskCreationForm = ->
    $scope.sidebarMode = 'taskCreation'
    $scope.currentTask = {}
    beforeEditTask = {}


  $scope.startPomodoro = (task) ->
    timer.startCountdown(task)
    modalInstance = $modal.open
      templateUrl: "static/app/views/partials/pomo-timer.html"
      size: "lg"
      controller: 'pomoTimerCtrl'
