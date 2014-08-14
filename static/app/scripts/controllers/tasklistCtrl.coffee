'use strict'

angular.module('niblApp').controller 'tasklistCtrl', ($scope, taskService, $modal, timer) ->
	$scope.tasks = taskService.getList().$object
	$scope.interval = 'Все время'
	console.log $scope.sidebarMode

	$scope.openTaskForm = (initTask) ->
		modalInstance = $modal.open
			templateUrl: "static/app/views/partials/task-form.html"
			size: "lg"
			controller: 'taskFormCtrl'
			resolve:   # maybe formname should be here
			 initTask: ->  
			 	initTask

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

