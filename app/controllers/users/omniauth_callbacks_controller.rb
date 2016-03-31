class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)
        if @user.persisted?
          sign_in @user#, root_path #sign_in_and_redirect
          redirect_to root_path + "/#firstPage/slide2"
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
        end
      end
    }
  end

  [:twitter, :facebook].each do |provider|
    provides_callback_for provider
  end
end