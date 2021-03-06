# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  has_one_attached :eyecatch
  has_one_attached :images

  
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user
  
end
