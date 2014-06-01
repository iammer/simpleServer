jQuery ($) ->
	$(document).foundation()
	#$('html').addClass 'debug'

	$.behavior
		'.changer':
			click: ->
				$(this).html('Changed')
			transform: ->
				$(this).html($(this).html()+" Me")

