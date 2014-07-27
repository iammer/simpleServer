fs= require 'fs'

genericLoader = (path, loader, app) ->
	fs.readdir path, (err, files) ->
		if err
			console.log "Unable to load things from #{path}: #{err}"
		else
			re= /(.*)?\.(.*)/
			for file in files
				[m, name, ext]= re.exec(file)
				if ext=='js' || ext=='coffee'
					loader require(path + '/' + file),
						name: name,
						path: path,
						ext: ext


module.exports = (loadersPath, app) ->
	genericLoader loadersPath, (loader, file) ->
		console.log "Loading #{loader.name}..."
		context = loader.init(app)
		genericLoader loadersPath + '/../' + loader.name, loader.loader.bind(context)
		loader.finish.call context
	

