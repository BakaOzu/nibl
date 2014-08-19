'use strict'

describe 'sidebarCtrl', ->

  # load the controller's module
  beforeEach module 'niblApp'

  scope  = {}
  sidebarCtrl = {}
  taskService = {}
  ctrl = {}


  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->

    scope = $rootScope.$new()
    mockTaskService = sinon.stub
      all: ->
      post: (task) ->
      
      
    mockToaster = sinon.stub(pop: ->, )

    ctrl = $controller 'sidebarCtrl', 
      $scope: scope,
      taskService: mockTaskService,
      toaster: mockToaster


  it 'should be initialized in news mode', ->
    expect(scope.sidebarMode).toBe 'news'
    expect(scope.selectedTask).toBe {}

  describe 'openNewsView', ->
    



