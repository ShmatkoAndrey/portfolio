@login_or_signup = (choose) ->
  login = $('#log_in')
  signup = $('#sign_up')
  switch choose
    when 'signup'
      login.hide()
      signup.show()
    when 'login'
      login.show()
      signup.hide()
  return