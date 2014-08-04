angular.module('niblApp').factory 'Project', ($firebase, FIREBASE_URL, Task) ->
	ref = new Firebase(FIREBASE_URL + 'projects')
	projects = $firebase(ref)

	Project = 
		all: projects
		create: (project) ->
			projects.$add project

		read: (projectId) ->
			projects.$child projectId

		delete: (projectId) ->
			tasks = Project.find().$child tasks
			projects.$remove projectId  #.then ->
				# Task.all.$remove(task.name())	for task in tasks


						