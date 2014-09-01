window.App = Ember.Application.create()

App.ApplicationAdapter = DS.FixtureAdapter.extend()

App.Router.map ->
	@resource 'thing', path: '/'
	@resource 'test'

App.TestRoute = Ember.Route.extend
	model: ->
		[
			a: 1
			b: 2
			c: 3
		,
			a: 4
			b: 5
			c: 6
		]

App.ThingRoute = Ember.Route.extend
	model: -> @store.find 'thing'

App.Thing = DS.Model.extend
	name: DS.attr 'string'
	value: DS.attr 'string'

App.Thing.FIXTURES = [
	id: 1
	name: 'a name'
	value: 'a value'
,
	id: 2
	name: 'another name'
	value: 'another value'
]

