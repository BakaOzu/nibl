'use strict'

angular.module('niblApp').filter 'hasTags',($timeout) ->
  (tasks, tags) ->
    if !_.isEmpty tasks or !_.isEmpty tags # check that we've got tasks and tags from server /we've them  
      selectedTags = (tag.name for tag in tags when tag.selected)
      unless _.isEmpty selectedTags # check if we selected any tasks
        filteredTasks = []
        for task in tasks
          for tag in selectedTags
            if tag not in task.tags 
              hasTag = false
              break
            hasTag = true # should rewrite this
          filteredTasks.push task if hasTag
        return filteredTasks
    return tasks



