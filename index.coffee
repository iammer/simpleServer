#!/usr/bin/env coffee

coffeescript= require 'connect-coffee-script'
connectless= require 'connect-less'
morgan= require 'morgan'
express= require 'express'
socketio= require 'socket.io'
session= require 'express-session'
http= require 'http'

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

app.use express.static __dirname + '/public'
app.use express.static __dirname + '/generated/public'
app.use express.static __dirname + '/bower'

loaderLoader __dirname + '/src/loaders', app

server.listen 8080

console.log 'Started...'
