'use strict'

describe 'timer', ->



	it 'should start with zeros in minutes, seconds, and undefined in timer type and task ', ->
		expect(timer.seconds).toEqual(0)
		expect(timer.minutes).toEqual(0)
		expect(timer.type).toBeUndefined()
		expect(timer.task).toBeUndefined()


	it 'should cancel currentTimer on timer.stop()', ->
		expect(mockInterval.cancel()).toBe(true)


	describe 'countdown', ->
		it 'should open modal window on start'
		expect(mockModal.open.called()).toBe(true)


		it 'should get time interval in minutes, change minutes to it, seconds to zero and timer type to countdown', ->
			# it should get time interval from User defaults, but i did'nt have it yet.
			timer.countdown 20, 'cleaning'
			expect(timer.seconds).toEqual(20)
			expect(timer.minutes).toEqual(0)
			expect(timer.type).toEqual('countdown')
			expect(timer.task).toEqual('cleaning')

		it 'should call Task.addPomodoro(taskid) with current timer.task in end', ->
			# It should give user some funny cats or phrases, but it comes later
			timer.countdown 20, {name: 'cleaning', id: 1}
			expect(mockTask.addPomodoro.called(1)).toBe(true)









