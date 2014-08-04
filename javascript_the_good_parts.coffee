'use strict'



first = (arg) ->
	arg

add = (first, second) ->
	first + second

mul = (first, second) ->
	first * second


idf = (arg) ->
	return ->
		arg
addf(first) ->
	(second) ->
		first + second

applyf (binary) ->
	(first) ->
		(second) ->
			binary first, second


curry = (func, numb1) ->
	return (numb2) ->
		func numb1, numb2




inc = addf 1
inc = applyf(add)(1)
inc = curry add, 1


# number.prototype.add =
# 	methodize(add)

methodize =  (func) ->
 	return (number) ->
 		func this number

demethodize = (method) ->
 	return (that, second) ->
 		method.call(that, second)

twice = (func) ->
	(arg) ->
		func(arg, arg)

composeu = (firstFunc, secondFunc) ->
	return (arg) ->
		secondFunc firstFunc(arg)


composeb = (firstFunc, secondFunc) ->
	return (first, second, third) ->
		secondFunc firstFunc(first,second), third


once = (func) ->
	called = false
	return (first, second) ->
		if called
			throw error
		func(first, second)

once = (func) ->
	return () ->
		f = func
		func = null
		f.apply this, arguments

counterf = (counter) ->
	counterf.inc: ->
		counter +1

	counter.dec: ->
		counter -1


revocable = (func) ->
	canAccess = true

	invoke:  ->
		if canAccess:
			func.apply this, arg
		else
			throw
	revoke: ->
		canAccess = false 

