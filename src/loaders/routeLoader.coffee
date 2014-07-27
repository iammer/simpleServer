express= require 'express'

module.exports =
	name: 'routes'
	init: (app) ->
		router: express.Router()
		app: app
	loader: (loaded, file) ->
		console.log "Loading route #{file.name}"
		@router.use "/#{file.name}", loaded(@app)
	finish: -> @app.use @router




