angular.module('niblApp').factory 'Project', ($firebase, FIREBASE_URL, Task) ->
	ref = new Firebase(FIREBASE_URL + 'projects')
	projects = $firebase(ref)

	Project = 
		all: projects
		create: (project) ->
			projects.$add project

		find: (projectId) ->
			projects.$child projectId

		delete: (projectId) ->
			tasks = Project.find().$child tasks
			projects.$remove projectId  #.then ->
				# Task.all.$remove(task.name())	for task in tasks

		getTasks: (projectId) ->
			tasks = []
			for tasId in projects.$child('tasks')
				console.log taskId
				tasks.push Task.find taskId

						