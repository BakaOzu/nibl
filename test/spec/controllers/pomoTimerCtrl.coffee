'use strict'

describe 'pomoTimerCtrl', ->

	beforeEach module 'niblApp'

	scope  = {}
	pomoTimerCtrl = {}
	mockTask = {}
	ctrl = {}
	mockModal = {}

	beforeEach inject ($controller, $rootScope) ->

		scope = $rootScope.$new()
	
		ctrl = $controller( 
			'pomoTimerCtrl' 
			$scope: scope 
			)



		# I don't know how task should come here. Should watch on directives again
	# it 'should have task on scope', ->


	it 'should start timer with 25min', ->
		expect(scope.remainingTime).toBe('1500')

	# it 'should decrement interval every second', ->
	# 	scope.interval = remainingTime
	# 	expect(scope.interval).toBe(1499)


	# it 'should be stopped and fire some message/event when interval reach zero', ->
	# 	scope.interval = 0 
	# 	expect(scope.mockMessage.called()).toBe(true)


	# 	#  Pomodoro service
	# it 'should add pomodoro to task', ->



