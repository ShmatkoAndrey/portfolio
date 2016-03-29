@login_or_signup = (choose) ->
  login = $('#log_in')[0]
  signup = $('#sign_up')[0]
  switch choose
    when 'signup'
      login.style.display = 'none'
      signup.style.display = 'block'
    when 'login'
      login.style.display = 'block'
      signup.style.display = 'none'
  return