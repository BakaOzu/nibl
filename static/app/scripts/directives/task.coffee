angular.module('niblApp').directive 'task', ->
  restrict: 'E'
  scope:true
  replace: true
  templateUrl: 'static/app/views/partials/task.html'
  controller: ($scope) ->
    $scope.isSelected = (task) ->
      return task.isSame $scope.selectedTask
    
    $scope.hasHoveredTag = (task) -> 
      $scope.hoveredTag.name in task.tags and
      not task.isSame $scope.selectedTask

    $scope.hasHoveredTagAndSelected = (task) ->
      $scope.selectedTask.url if  'url' of $scope.selectedTask and
      $scope.hoveredTag.name in task.tags
