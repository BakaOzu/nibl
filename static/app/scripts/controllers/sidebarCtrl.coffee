'use strict'

angular.module('niblApp').controller 'sidebarCtrl', ($scope, taskService, toaster) ->

  IsEqualToOrigin =  (task) ->
    origin  = _.find($scope.tasks, url: task.url)
    angular.equals $scope.selectedTask, origin

  alertIfhasUnsavedChanges = ->
    if ($scope.sidebarMode is 'taskCreation' and $scope.selectedTask isnt {}) or 
    ($scope.sidebarMode is 'taskEdition' and not IsEqualToOrigin $scope.selectedTask)
      
      discardedData =
        mode: $scope.sidebarMode
        task: $scope.selectedTask

      if $scope.sidebarMode is 'taskCreation'
        text = 'Создание задачи прервано, нажмите, чтобы вернуться.' # text should come from server with localization?
      else text = 'Создание задачи прервано, нажмите, чтобы вернуться.'

      toaster.pop 'warning', text, null, null, null, ->
        $scope.selectedTask = discardedData.task
        $scope.sidebarMode = discardedData.mode
        discardedData = {}
  

  $scope.openNewsView = ->
    alertIfhasUnsavedChanges()
    $scope.sidebarMode = 'news'
    $scope.selectedTask = {}

  $scope.openDetailsView = (task) ->  
    unless task.isSame $scope.selectedTask
      alertIfhasUnsavedChanges()
      $scope.sidebarMode = 'taskDetail'
      $scope.selectedTask = task

  $scope.openCreationView = ->
    alertIfhasUnsavedChanges()
    $scope.selectedTask = {}
    $scope.sidebarMode = 'taskCreation'

  $scope.openEditionView = (task) ->
    alertIfhasUnsavedChanges()
    $scope.selectedTask = task.clone()
    $scope.sidebarMode = 'taskEdition'


  $scope.save = (task) ->
    if $scope.sidebarMode is 'taskCreation'
      taskService.post(task).then (refinedTask) ->
        $scope.selectedTask = refinedTask
        $scope.tasks.push refinedTask
        $scope.sidebarMode = 'taskDetail'
      , (errors) ->
        toaster.pop 'error', errors.statusText
    else unless IsEqualToOrigin task
      task.put().then (refinedTask) ->
        taskIndex = _.findIndex($scope.tasks, url: task.url)
        $scope.tasks[taskIndex] = refinedTask
        $scope.sidebarMode = 'taskDetail'
      , (errors) ->
        toaster.pop 'error', errors.statusText

  $scope.delete = (task) ->
    task.remove().then -> # print errors, maybe
      _.pull $scope.tasks, task
      $scope.openNewsView()
      task = $scope.discardedTask
      toaster.pop 'error', 'Task deleted'
    , (errors) ->
      toaster.pop 'error', errors.statusText


  $scope.openNewsView()


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
