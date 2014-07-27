#!/usr/bin/env coffee

_= require 'underscore'
coffeescript= require 'connect-coffee-script'
connectless= require 'connect-less'
morgan= require 'morgan'
express= require 'express.io'
session= require 'express-session'

loaderLoader= require './src/loaderLoader'

app= express()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use morgan()

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

app.listen 8080

console.log 'Started...'
