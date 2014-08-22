jQuery ($) ->
	ctx = new (window.AudioContext || window.webkitAudioContext)()

	merger = ctx.createChannelMerger(2)
	merger.connect(ctx.destination)

	getSliderValue = (e) -> parseFloat(e.target.dataset.slider)

	for channel in ['left','right']
		do (channel) ->
			channelNum = channel == 'right' ? 0 : 1
			node = ctx.createOscillator()
			node.type = 'sine'
			$('#' + channel + 'Hz').asEventStream('change.fndtn.slider',getSliderValue)
				.throttle(100)
				.onValue (f) -> 
					node.frequency.value = f
					console.log channel + ': ' + f
			node.connect(merger, 0, channelNum)
			node.start()



