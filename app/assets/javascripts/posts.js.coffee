jQuery ->

	if $("#posts").length
		new PostDisplay()

class PostDisplay

	recieveJson: ->
		$('#display-post *').remove()
		$.getJSON $(this).attr('data-json'), (data) -> 
			$('#display-post').append Mustache.to_html($('#post-template').html(), data)
	


	constructor: ->
		$('.post-link').click( @recieveJson )
