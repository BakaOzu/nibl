'use strict'

angular.module('niblApp').controller 'sidebarCtrl', ($scope, taskService, Restangular) ->
  $scope.sidebarMode = 'news'
  $scope.currentTask = {}
  beforeEditTask = {}


  $scope.startTaskCreation = ->
    $scope.sidebarMode = 'taskCreation'
    $scope.currentTask = {}
    beforeEditTask = {}

  $scope.edit = (task) ->
    beforeEditTask = task
    $scope.currentTask = Restangular.copy(task)
    $scope.sidebarMode = 'taskEdition'


  $scope.save = (task) ->
    if $scope.sidebarMode is 'taskEdition' 
      task.put().then ->
        last =  Restangular.one('get_last').get().$object # here it could fail, without problems
        $scope.tasks = _.without $scope.tasks, task
        $scope.tasks.push last
    else
      # task.availability_type = 'always'
      # task.pomodoro_all = 0
      # task.pomodoro_completed = 0
      # task.tags = []
      taskService.post(task).then ->
        Restangular.one('get_last').get().then (data) ->
          $scope.tasks.push data
          console.log  data
      , (error) ->
        console.log error 

    $scope.sidebarMode = 'taskDetail'

  $scope.discard = ->
    $scope.sidebarMode = 'taskDetail'
    $scope.currentTask = beforeEditTask

  $scope.delete = (task) ->
    $scope.sidebarMode = 'news'
    console.log task
    task.remove().then ->
    $scope.tasks = _.without $scope.tasks, task
    , (error) ->
      console.log error

 








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
