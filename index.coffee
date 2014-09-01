#!/usr/bin/env coffee

coffeescript= require 'connect-coffee-script'
connectless= require 'connect-less'
morgan= require 'morgan'
express= require 'express'
socketio= require 'socket.io'
session= require 'express-session'
http= require 'http'
ember= require 'ember-connect-middleware'

app= express()
server= http.Server(app)
io= socketio(server)

loaderLoader= require './src/loaderLoader'

app.set 'io', io
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use morgan 'combined'

app.use coffeescript
	src: __dirname + '/src/client/coffee'
	dest: __dirname + '/generated/public/coffee'
	prefix: '/coffee/'

app.use connectless
	src: __dirname + '/src/client/less'
	dst: __dirname + '/generated/public/less'
	dstRoot: __dirname + '/generated/public'
	debug: true

app.use '/ember', ember
	path: __dirname + '/src/client/ember'
	scripts: [
		"/js/jquery/jquery.js",
		"/js/handlebars/handlebars.min.js",
		"/js/ember/ember.min.js",
		"/js/ember-data/ember-data.min.js",
		"/js/modernizr/modernizr.js",
		"/js/foundation/foundation.min.js"
	],
	stylesheets: [
		'/css/foundation/normalize.css',
		'/css/foundation/foundation.css'
	]

app.use express.static __dirname + '/public'
app.use express.static __dirname + '/generated/public'
app.use express.static __dirname + '/bower'

loaderLoader __dirname + '/src/loaders', app

server.listen 8080

console.log 'Started...'
