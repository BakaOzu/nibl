'use strict'

angular.module('niblApp').controller 'pomoTimerCtrl', ($scope, timer, $modalInstance) ->
	$scope.timer = timer

	$modalInstance.result.then(->
		console.log 'success'
	,  ->
		timer.fullReset()
	)


		




