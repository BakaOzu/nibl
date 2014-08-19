'use strict'

angular.module('niblApp').controller 'tagCloudCtrl', ($scope, tagService) ->
  $scope.tags = tagService.getList().$object