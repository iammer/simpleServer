express= require 'express'

module.exports= (map) ->
		router= express.Router()
		router.get '/', (req,res) ->
			res.send 'It worked'

		router.get '/view/:p', (req, res) ->
			res.render 'testView',
				pageTitle: 'Test View'
				p: req.params.p

		router



