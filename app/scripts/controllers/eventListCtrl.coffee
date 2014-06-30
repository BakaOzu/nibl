'use strict'

angular.module('niblApp').controller 'eventListCtrl', ($scope, Event) ->
	$scope.events = Event.all

