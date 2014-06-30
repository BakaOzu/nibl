'use strict'

angular.module('niblApp').controller 'projectListCtrl', ($scope, $modal, Project, Task) ->
	$scope.projects = Project.all
	$scope.tasks =  Task.all

	$scope.openProjectForm = -> 
		modalInstance = $modal.open
			templateUrl: "views/partials/project-create.html"
			size: "lg"
			scope: $scope
			controller: ($scope, Project) ->
				$scope.project = {}
				$scope.createProject =  ->
					Project.create $scope.project
					$scope.project = {}
					$modal.close()


	$scope.completeTask = (task) ->
		Task.complete task.$id

	$scope.undoCompleteTask = (task) ->
		Task.undoComplete task.$id
	
	$scope.deleteTask = (task) ->
		Task.delete task.$id

	$scope.openTaskForm = -> 
		modalInstance = $modal.open
			templateUrl: "views/partials/task-create.html"
			size: "lg"
			scope: $scope
			controller: ($scope, Task) ->
				$scope.refreshTaskForm = ->
					$scope.task = 
						availabilityType: 'anytime',
						daysAvailable: (true for x in [0..6])

				$scope.setDaysAvailable = ->
					if $scope.task.availabilityType is 'anytime'
						$scope.task.daysAvailable = (true for x in [0..6])
					else
					  $scope.task.daysAvailable = (false for x in [0..6])
				
				$scope.createTask = ->
					delete $scope.task.weekDaysAvailable if $scope.task.availabilityType is 'once' #Check that
					Task.create $scope.task 						
					$scope.refreshTaskForm()
					modalInstance.close()
				
				$scope.refreshTaskForm()
				


	# $scope.editTask = (task) ->
		# Should be same as create task form.
		




