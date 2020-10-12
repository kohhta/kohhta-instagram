# == Schema Information
#
# Table name: profifles
#
#  id           :bigint           not null, primary key
#  introduction :text
#  nickname     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_profifles_on_user_id  (user_id)
#
class Profifle < ApplicationRecord
  belongs_to :user

  def nick_name
    user.display_name
  end
end
