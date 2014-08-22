module.exports = (app, io, ns) ->
	setInterval ->
		ns.emit('now', Date.now())
	, 1000

	(socket) ->
		socket.on 'add', (v, cb) ->
			cb(parseInt(v[0]) + parseInt(v[1]))

			
