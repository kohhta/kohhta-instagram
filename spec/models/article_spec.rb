require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:article) do
      user.articles.build({
        content: Faker::Lorem.characters(number: 30)
      })
    end
    it '記事を保存できる' do

      expect(article).to be_valid
    end
  end

  context 'コンテントの文字ない場合' do
    let!(:article) do
      user.articles.create({
        content: Faker::Lorem.characters(number: 0)
      })
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:content][0]).to eq('を入力してください')
    end
  end
  
end