@login_or_signup = (choose) ->
  $('#log_in').toggle(choose if 'signup')
  $('#sign_up').toggle(choose if 'login')