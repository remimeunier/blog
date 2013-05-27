jQuery ->

	if $("#posts").length
		new PostDisplay()

	$('.genre').click ->
		genreId = $(this).attr("data-click-id")
		$('.post').removeClass('cache')
		if genreId != "0"
			$('.post[data-genre-id != '+genreId+']').addClass('cache')

		$('li').removeAttr('class')
		$('li[data-active-id = '+genreId+']').attr('class','active')
			

class PostDisplay

	recieveJson: ->
		$('#display-post *').remove()
		$.getJSON $(this).attr('data-json'), (data) -> 
			$('#display-post').append Mustache.to_html($('#post-template').html(), data)	

	constructor: ->
		$(document).on 'click', '.post-link', @recieveJson

