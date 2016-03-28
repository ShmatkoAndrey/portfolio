module ApplicationHelper

  def resource_name
    :user
  end
  def resource
    @resource ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def resource_class
    devise_mapping.to
  end

  def skills_list
    %w(deviseOmniauth dropzone googleMap tinymce youTube)
  end

  def messages_tiny
    Message.all.reverse
  end

  def videos
    Video.all.reverse
  end
end
