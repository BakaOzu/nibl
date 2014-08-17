'use strict'

angular.module('niblApp').factory 'taskService', (Restangular) ->
  Restangular.extendModel 'tasks', (model) ->
    model.addPomodoro = ->
      model.pomodoro_completed +=1
      model.patch()
    return model

  Restangular.all('tasks')

  # route = Restangular.all('tasks')
  # tasklist = []
  # previousVersion = {} # for revert Task Edit

  # taskService = 
  #   all: route.getList().$object
  #   create: (task) ->
  #     route.post(task).then (data) =>
  #       this.all.push data
  #   remove: (task) ->
  #     task.remove().then => # print errors, maybe
  #       _.pull this.all, task

  #   update: (newTaskVersion) ->
  #     taskIndex = _.findIndex(this.all, url: newTaskVersion.url)
  #     if angular.equals this.all[taskIndex], newTaskVersion then return
  #     newTaskVersion.put().then (refinedTask) =>
  #       this.all[taskIndex] = refinedTask

  #   copy: (task) ->
  #     Restangular.copy task

  #   _logErrorCallback: (error) ->
  #     console.log error








      





