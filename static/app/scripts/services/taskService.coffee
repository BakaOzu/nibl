'use strict'

angular.module('niblApp').factory 'taskService', (Restangular) ->
  Restangular.extendModel 'tasks', (model) ->
    # console.log model
    # for i in model.tags
    # 	console.log i
    model.addPomodoro = ->
      model.pomodoro_completed +=1
      model.patch()
    return model

  return Restangular.all('tasks')



