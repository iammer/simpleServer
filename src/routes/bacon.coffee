express= require 'express'

module.exports= (app) ->
		router= express.Router()
		router.get '/', (req,res) ->
			res.render 'baconTest',
				pageTitle: 'Bacon Test'

		router



