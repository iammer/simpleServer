jQuery ($) ->
	$.behavior
		'span.test':
			transform: ->
				$(this).text $(this).text().toUpperCase()

	setTimeout ->
		$('#testSpan').addClass 'test'
	, 1000
	


