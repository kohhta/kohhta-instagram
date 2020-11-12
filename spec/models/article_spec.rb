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
require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context '内容が入力されている場合' do
    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'コンテントの文字ない場合' do
    let!(:article) { build(:article, content:  Faker::Lorem.characters(number: 0), user: user) }
    # ここでダミーデータ作成。0文字の場合

    before do
      article.save
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:content][0]).to eq('を入力してください')
    end
  end
  
end
