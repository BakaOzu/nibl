angular.module('niblApp').factory 'Task', ($firebase, FIREBASE_URL, Event) ->
	ref = new Firebase(FIREBASE_URL + 'tasks')
	tasks = $firebase(ref)

	polish = (task) ->
		task.projectId = task.project.$id
		delete task.project  
		delete task.daysAvailable if task.availabilityType is 'once'		
		return task



	Task = 
		all: tasks
		create: (task) ->
			task.creationDate = Date.now()
			task.completed = false
			tasks.$add(polish(task))

		read: (taskId) ->
			tasks.$child taskId

		edit: (task) ->
			console.log task.project
			tasks.$child(task.$id).$set(polish(task))

		delete: (taskId) ->
			tasks.$remove(taskId)

		complete: (taskId, counters) ->
			# event = 
			# 	task: taskId
			# 	creationDate: Date.now()
			# event.counters = counters if counters


			# Event.create(event).then ->
			tasks.$child(taskId).$update({completed: true})

		undoComplete: (taskId) -> # don't delete last event
			tasks.$child(taskId).$update({completed:false})
