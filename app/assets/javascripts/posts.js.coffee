jQuery ->

	if $("#posts").length
		new PostDisplay($('.container'))

class PostDisplay

	recieveJson: ->
		$('#display-post *').remove()
		$.getJSON $(this).attr('data-json'), (data) -> 
			$('#display-post').append Mustache.to_html($('#post-template').html(), data)	

	constructor: (@document) ->
		$('.post-link').click( @recieveJson )
