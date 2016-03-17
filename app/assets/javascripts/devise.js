function login_or_signup(choose) {

    var login = $('#log_in')[0];
    var signup =  $('#sign_up')[0];

    switch(choose){
        case 'signup':
            login.style.display = 'none';
            signup.style.display = 'block';
            break;

        case 'login':
            login.style.display = 'block';
            signup.style.display = 'none';
             break;
    }
}