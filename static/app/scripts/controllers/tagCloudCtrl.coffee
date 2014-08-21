'use strict'

angular.module('niblApp').controller 'tagCloudCtrl', ($scope, tagService, $timeout) ->
  $scope.tags = tagService.getList().$object
  $scope.hoveredTag = {}
  timeout = {}


  $scope.swapSelection = (tag) ->
    $scope.resetHoveredTag()
    tag.selected = !tag.selected

  $scope.isSelectedTag = (tag) ->
    tag.selected

  $scope.setHoveredTag = (tag) ->
    timeout =  $timeout ->
      $scope.hoveredTag = tag
    , 300

  $scope.resetHoveredTag = ->
    $timeout.cancel(timeout)
    $scope.hoveredTag = {}


  # $scope.getSelectedTags = ->
  #   console.log  $scope.tags
  #   [tag.name for tag in $scope.tags if tag.selected]