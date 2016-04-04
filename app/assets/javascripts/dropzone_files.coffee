@showImage = (url) ->
  code = '<img src="' + url + '" />'
  $('#image_show').html code

Dropzone.autoDiscover = false
$(document).ready ->
  initDropzone()
  tabsDropzone('top')

appendContent = (imageUrl, mediaId) ->
  $('#media_download').prepend '<div class="thumbnail" style="border: 1px solid red;" onClick="showImage(\'' + imageUrl + '\')">' + '<img src="' + imageUrl + '"/></div>'

@initDropzone = ->
  if $('#media-dropzone').length > 0
    mediaDropzone = new Dropzone('#media-dropzone')
    mediaDropzone.on 'success', (file, responseText) ->
      appendContent responseText.file.url, responseText.id
      _this = @ # если на прямую, то не работает
      setTimeout (->
        _this.removeAllFiles()
      ), 5000

@tabsDropzone = (tab_name) ->
  $('#nav-dropzone li').removeClass('active')
  $('.dropzone_nav_'+tab_name).addClass('active')
  $('#media_tabs > div').hide()
  $('#media_'+tab_name).show()
