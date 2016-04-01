class Users::SessionsController < Devise::SessionsController
skip_before_filter :verify_authenticity_token, :only => [:destroy, :create]
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  def create
    @params_session = [params[:user][:email]]
    @page = params[:page]
    resource = User.find_for_database_authentication(:email => params[:email])
    return @error = 'Invalid email or password' unless resource

    if resource.valid_password?(params[:password])
      resource.ensure_authentication_token!
      respond_to do |format|
        format.js
      end
    end
  end

  # def sign_in_and_redirect(resource_or_scope, resource=nil)
  #   scope = Devise::Mapping.find_scope!(resource_or_scope)
  #   resource ||= resource_or_scope
  #   sign_in(scope, resource) unless warden.user(scope) == resource
  # end

  # DELETE /resource/sign_out
  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)

    @page = params[:page]

    respond_to do |format|
      format.js {}
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
