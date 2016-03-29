@show_youtube = (uid) ->
  code = '<iframe src="https://www.youtube.com/embed/' + uid + '" frameborder="0" allowfullscreen></iframe>'
  $('#youtube_player').html code
  return