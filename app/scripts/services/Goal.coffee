angular.module('niblApp').factory 'Goal', ($firebase, FIREBASE_URL) ->
	ref = new Firebase(FIREBASE_URL + 'goals')
	goals = $firebase(ref)

	goal = 
		all: goals
		create: (goal) ->
			goals.$add goal
		find: (goalId) ->
			goals.$child goalId
		delete: (goalId) ->
			goals.$remove goalId











