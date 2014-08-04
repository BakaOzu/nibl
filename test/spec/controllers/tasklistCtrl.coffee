'use strict'

describe 'tasklistCtrl', ->

	# load the controller's module
	beforeEach module 'niblApp'

	scope  = {}
	tasklistCtrl = {}
	mockTask = {}
	ctrl = {}
	mockModal = {}

	# Initialize the controller and a mock scope
	beforeEach inject ($controller, $rootScope) ->

		scope = $rootScope.$new()
		mockTask = sinon.stub(
			all: 'tasklist'
			complete: (taskId) ->
			undocomplete:  (taskId) ->
			delete:  (taskId) ->
			)

			
		mockModal = sinon.stub(open: ->)

		ctrl = $controller( 
			'tasklistCtrl' 
			$scope: scope 
			Task: mockTask 
			Project: {} 
			$modal: mockModal
			)

	it 'should get task array by calling Task.all', ->
		expect(scope.tasks).toBe('tasklist')

	# it 'should get tags array'

	# it 'should get projects array'

	it 'should call modal service on openTaskForm', ->
	    scope.openTaskForm()
	    expect(mockModal.open.called).toBe(true)



	it 'should switch task.complete to true by calling Task.complete if checkbox is clicked and vice versa', ->
		task = {$id: 1, completed: true}
		expect(mockTask.complete.calledWith(1)).toBe(true)
		task.completed = false
		expect(mockTask.undoComplete.calledWith(1)).toBe(true)




	it 'should call Task.delete on $scope.deleteTask', ->
		task = { $id: 1 }
		scope.deleteTask(task)
		expect(mockTask.delete.calledWith(1)).toBe(true)

		

	# it 'should refresh task time/status', ->
		# expect


	# it 'should deleteTask', ->