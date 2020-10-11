# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  validates :content, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
