angular.module('niblApp').factory 'timer', ($interval, $modal) ->

	User = {pomodoroInterval:1500000} # 25min in milliseconds

	timer =
		current: {}
		task: {}
		remainingTime: User.pomodoroInterval

		_countdown: (timeRemains) ->
			endMoment = moment() + timeRemains
			that = this
			this.current = $interval ->
				that.remainingTime = endMoment - moment()
				console.log that.remainingTime
				that.stop() if that.remainingTime <= 0
			, 1000
				
		startCountdown: (task) ->
			this.task = task
			this._countdown(User.pomodoroInterval)

		stop: ->
			$interval.cancel this.current
			this.current = undefined
			
		resume: ->
			this._countdown(this.remainingTime)

		reset: -> 
			this.stop()
			this.remainingTime = User.pomodoroInterval

		fullReset: -> # used when dismissing modal
			this.reset()
			task = {}



