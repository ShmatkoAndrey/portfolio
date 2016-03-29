$(document).ready ->

  $('#user_avatar').change ->
    if this.files and this.files[0]
      reader = new FileReader
      reader.onload = (e) ->
        $('#avatar').attr('src', e.target.result)
        return
      reader.readAsDataURL this.files[0]