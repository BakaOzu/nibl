'user strict'

angular.module('niblApp').directive 'pomodoroCount', ->

# <span  class="glyphicon glyphicon-unchecked"><span>
	# template = 
	# link = ->
	# 	console.log 'exist'

		restrict: 'A'
		link: (scope, element) ->
			pomodoroBlock = ''
			completedPomodoro = '<span style="color:red" class="glyphicon glyphicon-expand"></span>'
			pomodoroBlock += completedPomodoro for i in [0..scope.task.pomodoro] by 1
			element.append(pomodoroBlock)
