'use strict'

angular.module('niblApp').controller 'sidebarCtrl', ($scope, taskService, Restangular) ->
  resetSidebar = ->
    $scope.sidebarMode = 'news'
    $scope.currentTask = {}

  $scope.openTaskCreationForm = ->
    $scope.currentTask = {}
    $scope.sidebarMode = 'taskCreation'

  $scope.openTaskEditForm = (task) ->
    $scope.currentTask = taskService.copy task
    $scope.sidebarMode = 'taskEdition'


  $scope.save = (task) ->
    if $scope.sidebarMode is 'taskCreation'
      taskService.create task
    else
      taskService.update task
    $scope.sidebarMode = 'taskDetail'

  $scope.discard = ->
    if $scope.sidebarMode is 'taskCreation'
      resetSidebar()
    else
      $scope.sidebarMode = 'taskDetail'

  $scope.delete = (task) ->
    resetSidebar()
    taskService.remove task

  resetSidebar()


  # $scope.refreshForm = -> 
  #   $scope.task = {}
      # availabilityType: 'anytime'
      # # daysAvailable: (true for x in [0..6])
      # counters: []

  # $scope.setDaysAvailable =  ->
  #   if $scope.task.availabilityType is 'anytime'
  #     $scope.task.daysAvailable = (true for x in [0..6])
  #   else
  #     $scope.task.daysAvailable = (false for x in [0..6])
