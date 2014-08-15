'use strict'

angular.module('niblApp').controller 'taskFormCtrl', ($scope, $filter, $modalInstance, taskService, projectService, initTask) ->
	$scope.projects = projectService.getList().$object

	


	$scope.refreshForm = ->
		$scope.counter = {}
		$scope.task =
			availabilityType: 'anytime'
			daysAvailable: (true for x in [0..6])
			counters: []

	$scope.setDaysAvailable =  ->
		if $scope.task.availabilityType is 'anytime'
			$scope.task.daysAvailable = (true for x in [0..6])
		else
			$scope.task.daysAvailable = (false for x in [0..6])

	# $scope.addCounter = ->
	# 	$scope.task.counters.push $scope.counter
	# 	$scope.counter = {}

	# $scope.deleteCounter = ->
	# 	$scope.task.counters.splice $scope.$index, 1

	$scope.submitTask = ->				
		submitFunc $scope.task

		$modalInstance.close()

	if initTask
		$scope.formName = 'Edit Task'
		$scope.task = initTask
		submitFunc = ->
			Task.edit $scope.task
		# $scope.task.project =         # This don't work and i don't figure out why
		# 	name: ($filter('orderByPriority') (Project.read($scope.task.projectId)))[0]
		# 	$id: initTask.projectId 	
		# console.log $scope.task.project			
	else
		$scope.formName = 'Edit Task'
		$scope.refreshForm()
		submitFunc = ->
			taskService.post $scope.task