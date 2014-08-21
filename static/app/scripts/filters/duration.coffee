'use strict'

angular.module('niblApp').filter 'duration', ->
  (rawDuration) ->
    rawDuration = Math.ceil(rawDuration / 100) * 100
    duration = moment.duration(rawDuration)
    minutes = if duration.minutes() >= 10 then duration.minutes() else '0' + duration.minutes() 
    seconds = if duration.seconds() >= 10 then  duration.seconds() else '0' + duration.seconds()  
    return minutes + ' : ' + seconds

