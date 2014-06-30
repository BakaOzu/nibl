angular.module('niblApp').factory 'Event', ($firebase, FIREBASE_URL) ->
	ref = new Firebase(FIREBASE_URL + 'Tasks')
	events = $firebase(ref)

	Event = 
		all: events
		create: (event) ->
			events.$add(event)

		read: (eventId) ->
			events.$child eventId

		update: (event, eventId) ->
			events.$child(eventId).$set(event)

		delete: (eventId) ->
			events.$remove(eventId)

	