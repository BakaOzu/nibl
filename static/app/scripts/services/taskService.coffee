'use strict'

angular.module('niblApp').factory 'taskService', (Restangular) ->
  Restangular.extendModel 'tasks', (model) ->
    console.log model
    model.addPomodoro = ->
      model.pomodoro_completed +=1
      model.patch()
    return model

  Restangular.all('tasks')



