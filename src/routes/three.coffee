express= require 'express'

module.exports= (app) ->
		router= express.Router()
		router.get '/:name', (req,res) ->
			res.render 'three',
				name: req.params.name
