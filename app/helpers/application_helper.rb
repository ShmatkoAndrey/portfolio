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

  def avatar(user, size = '150x150')
    unless user.nil?
      if user.avatar.nil? || user.avatar.blank? || !user.avatar.file.exists?
        image_tag('avatar.png', size: size, id: 'avatar')
      else
        image_tag(user.avatar, size: size, id: 'avatar')
      end
    end
  end

end
