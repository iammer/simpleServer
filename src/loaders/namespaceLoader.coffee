module.exports =
	name: 'namespaces'
	init: (app) ->
		app: app
		io: app.get 'io'
	loader: (loaded, file) ->
		name = if file.name=='root' then '/' else "/#{file.name}"
		console.log "Loading namespace #{name}"
		ns=@io.of(name)
		ns.on 'connection', loaded(@app, @io, ns)
	finish: -> true
