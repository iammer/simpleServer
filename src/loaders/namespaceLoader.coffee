socketio = require 'socket.io'

module.exports =
	name: 'namespaces'
	init: (app) ->
		app.http().io()
		app: app
	loader: (loaded, file) ->
		name = if file.name=='root' then '/' else "/#{file.name}"
		console.log "Loading namespace #{name}"
		@app.io.route name, loaded(@app)
	finish: -> ''
