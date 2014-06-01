fs= require 'fs'
express= require 'express'

module.exports = (path, map) ->
		router= express.Router()
		fs.readdir path, (err,files) ->
			if err
				console.log "Unable to load routes: " + err
			else
				re= /(.*)?\.(.*)/
				for file in files
					[m, name, ext]= re.exec(file)
					if ext=='js' || ext=='coffee'
						router.use "/#{name}", require(path + '/' + file)(map)
						console.log "Found route #{name} in #{file}"

		router




