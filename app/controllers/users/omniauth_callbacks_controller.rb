class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}

        auth = request.env["omniauth.auth"]

        puts auth.extra.raw_info.inspect .blue
        puts auth.info.image .red
        puts auth.extra.raw_info.name .red
        puts auth.extra.raw_info.email .red

        redirect_to :back
        # respond_to do |format|
        #     format.js
        # end
      end
    }
  end

  [:twitter, :facebook].each do |provider|
    provides_callback_for provider
  end

  # def after_sign_in_path_for(resource)
  #   if resource.email_verified?
  #     super resource
  #   else
  #     finish_signup_path(resource)
  #   end
  # end
end
