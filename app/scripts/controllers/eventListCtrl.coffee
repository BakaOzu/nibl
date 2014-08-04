'use strict'

angular.module('niblApp').controller 'eventListCtrl', ($scope, Event, Task) ->
	$scope.events = Event.all
	$scope.getTask = (taskId) ->
		console.log taskId
		Task.read(taskId).name

