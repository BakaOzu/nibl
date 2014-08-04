'use strict'

angular.module('niblApp').controller 'tasklistCtrl', ($scope, Project, Task, $modal, timer) ->
	$scope.projects = Project.all
	$scope.tasks =  Task.all

	$scope.openTaskForm = (initTask) ->
		modalInstance = $modal.open(
			templateUrl: "views/partials/task-form.html"
			size: "lg"
			controller: 'taskFormCtrl'
			resolve:   # maybe formname should be here
			 initTask: ->  
			 	initTask
			)

	$scope.switchComplete = (task) -> # should be moved to Task service with fine ifelse and just by taskid
		if task.completed
			Task.complete  task.$id
		else
			Task.undoComplete task.$id

	
	$scope.deleteTask = (task) ->
		Task.delete task.$id

	$scope.startPomodoro = (task) ->
		timer.startCountdown(task)
		modalInstance = $modal.open
			templateUrl: "views/partials/pomo-timer.html"
			size: "lg"
			controller: 'pomoTimerCtrl'


	$scope.setCurrentTask = (task) ->
		console.log task
		task.project = Project.read(task.projectId)
		console.log task
		$scope.currentTask = task