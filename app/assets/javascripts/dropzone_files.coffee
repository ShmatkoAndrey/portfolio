@showImage = (url) ->
  code = '<img src="' + url + '" />'
  $('#image_show').html code

Dropzone.autoDiscover = false
$(document).ready ->
  if $('#media-dropzone').length > 0
    $ ->
      mediaDropzone = undefined
      mediaDropzone = new Dropzone('#media-dropzone')
      mediaDropzone.on 'success', (file, responseText) ->
        appendContent responseText.file.url, responseText.id
        _this = this
        setTimeout (->
          _this.removeAllFiles()
          return
        ), 5000
        return

    appendContent = (imageUrl, mediaId) ->
      $('#media-contents').prepend '<div class="thumbnail" style="border: 1px solid red;" onClick="showImage(\'' + imageUrl + '\')">' + '<img src="' + imageUrl + '"/></div>'