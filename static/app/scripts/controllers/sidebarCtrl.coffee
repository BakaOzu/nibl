'use strict'

angular.module('niblApp').controller 'sidebarCtrl', ($scope, tagService) ->
	 # $scope.loadTags = ->
	 # 	a=  tagService.getList().then

	$scope.sidebarMode = 'initial' 
	

	$scope.edit = (task) ->
		$scope.editedTask = task
		$scope.sidebarMode = 'taskEdit'
		$scope.currentTask = {}


	$scope.saveChanges = (task) ->
		console.log task
