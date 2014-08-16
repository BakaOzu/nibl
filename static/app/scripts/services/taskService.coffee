'use strict'

angular.module('niblApp').factory 'taskService', (Restangular) ->
  Restangular.extendModel 'tasks', (model) ->
    model.addPomodoro = ->
      model.pomodoro_completed +=1
      model.patch()
    return model

  route = Restangular.all('tasks')
  tasklist = []
  previousVersion = {} # for revert Task Edit

  taskService = 
    all: route.getList().$object
    create: (task) ->
      route.post(task).then (data) =>
        this.all.push data
    remove: (task) ->
      task.remove().then => # print errors, maybe
        _.pull this.all, task

    update: (newTaskVersion) ->
      taskIndex = _.findIndex(this.all, url: newTaskVersion.url)
      if angular.equals this.all[taskIndex], newTaskVersion then return
      newTaskVersion.put().then (refinedTask) =>
        this.all[taskIndex] = refinedTask







      # for task in this.all
        # if task.url is newTaskVersion.url
        #   console.log task.url
        #   console.log task
        #   console.log newTaskVersion.url     
        #   if angular.equals task , newTaskVersion then return
        #   newTaskVersion.put().then (refineTask) =>
        #     console.log newTaskVersion
        #     console.log task
        #     console.log refineTask
        #     task = refineTask

    copy: (task) ->
      Restangular.copy task

    _getLastandUpdateAll: ->
      Restangular.one('get_last').get().then (data) =>
          this.all.push data
    _logErrorCallback: (error) ->
      console.log error








      





