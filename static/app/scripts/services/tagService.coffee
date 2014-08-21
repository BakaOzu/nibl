'use strict'

angular.module('niblApp').factory 'tagService', (Restangular) ->
  Restangular.extendModel 'tags', (model) ->
    model.selected = false # should it be in scope?
    return model
  Restangular.all('tags')