# frozen_string_literal: true

module UserDecorator
  
  def display_name
    profile&.nickname || self.username
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

end
