jQuery ($) ->
	socket=io.connect('/bacon')

	mapThoughSocket = (obsv, socket, eventName) ->
		obsv.flatMap (v) ->
			Bacon.fromCallback (cb) ->
				socket.emit eventName, v, cb

	serverNow=Bacon.fromEventTarget(socket, 'now')
		
	clientNow=serverNow.map -> Date.now()

	offset=Bacon.combineWith ((x,y) -> Math.abs(x-y)), serverNow, clientNow
	
	serverNow.toProperty('The beginning')
		.assign($('#serverNow'),'text')

	clientNow.toProperty(Date.now())
		.assign($('#clientNow'),'text')

	offset.onValue($('#nowOffset'),'text')
				
	bjq=Bacon.$
	a=bjq.textFieldValue($('#a'),'')
	b=bjq.textFieldValue($('#b'),'')
	combo=Bacon.combineWith(
		(x,y) -> [x, y]
		a,b
	).flatMap (v) ->
		Bacon.fromCallback (cb) ->
			socket.emit 'add', v, cb

	c=bjq.textFieldValue($('#c'),'').addSource(combo)

