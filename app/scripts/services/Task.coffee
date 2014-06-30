angular.module('niblApp').factory 'Task', ($firebase, FIREBASE_URL, Event) ->
	ref = new Firebase(FIREBASE_URL + 'tasks')
	tasks = $firebase(ref)

	Task = 
		all: tasks
		create: (task) ->
			task.creationDate = Date.now()
			task.finished = false
			task.project = task.project.$id  # not good
			tasks.$add(task)

		read: (taskId) ->
			tasks.$child taskId

		update: (task, taskId) ->
			tasks.$child(taskId).$set(task)

		delete: (taskId) ->
			tasks.$remove(taskId)

		complete: (taskId) ->
			event = 
				task: taskId
				creationDate: Date.now()

			Event.create(event).then ->
				tasks.$child(taskId).$update({finished: true})

		undoComplete: (taskId) -> # don't delete last event
			tasks.$child(taskId).$update({finished:false})



	


