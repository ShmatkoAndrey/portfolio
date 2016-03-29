class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  skip_before_filter :verify_authenticity_token, :only => [:destroy, :create]
  # prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]


  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    respond_to do |format|
      resource.save
      @error = resource.errors.full_messages
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          sign_up(resource_name, resource)
          format.js
        else
          expire_data_after_sign_in!
          format.js
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        format.js
      end
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    current_user.update(account_update_params)
    respond_to do |format|
      format.js
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :current_password, :avatar)
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  def update_resource(resource, params)
    puts 'upd'.red
    resource.update_without_password(params)
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :avatar
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
