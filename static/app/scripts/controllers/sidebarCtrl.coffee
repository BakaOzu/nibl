'use strict'

angular.module('niblApp').controller 'sidebarCtrl', ($scope, taskService, toaster) ->

  resetSidebar = ->
    $scope.sidebarMode = 'news'
    $scope.selectedTask = {}
    $scope.originalTask = {} 
    $scope.discardedData = {}


  $scope.alertIfUnchangedChanges = ->
    if ($scope.sidebarMode is 'taskCreation' and $scope.selectedTask isnt {}) or 
    ($scope.sidebarMode is 'taskEdition' and
    not angular.equals $scope.selectedTask, $scope.originalTask)
      
      $scope.discardedData =
        mode: $scope.sidebarMode
        task: $scope.selectedTask

      if $scope.sidebarMode is 'taskCreation'
        text = 'Создание задачи прервано, нажмите, чтобы вернуться.' # text should come from server with localization?
      else text = 'Создание задачи прервано, нажмите, чтобы вернуться.'

      toaster.pop 'warning', text, null, null, null, ->
        $scope.selectedTask = $scope.discardedData.task
        $scope.sidebarMode = $scope.discardedData.mode
  

  $scope.openTaskCreationForm = ->
    $scope.alertIfUnchangedChanges()
    $scope.selectedTask = {}
    $scope.sidebarMode = 'taskCreation'

  $scope.openTaskEditForm = (task) ->
    $scope.alertIfUnchangedChanges()
    $scope.originalTask = task
    $scope.selectedTask = task.clone()
    $scope.sidebarMode = 'taskEdition'


  $scope.save = (task) ->
    if $scope.sidebarMode is 'taskCreation'
      taskService.post(task).then (refinedTask) ->
        $scope.tasks.push refinedTask
        $scope.sidebarMode = 'taskDetail'
      , (errors) ->
        toaster.pop 'error', errors.statusText
    else unless angular.equals $scope.selectedTask, $scope.originalTask
      task.put().then (refinedTask) ->
        taskIndex = _.findIndex($scope.tasks, url: task.url)
        $scope.tasks[taskIndex] = refinedTask
        $scope.sidebarMode = 'taskDetail'
      , (errors) ->
        toaster.pop 'error', errors.statusText



  $scope.delete = (task) ->
    task.remove().then -> # print errors, maybe
      _.pull $scope.tasks, task
      resetSidebar()
      task = $scope.discardedTask
      toaster.pop 'error', 'Task deleted'
    , (errors) ->
      toaster.pop 'error', errors.statusText



  $scope.discard = ->
  if $scope.sidebarMode is 'taskCreation'
    resetSidebar()
  else
    $scope.sidebarMode = 'taskDetail'


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
