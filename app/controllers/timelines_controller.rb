class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    # @articles = Article.where(user_id: user_ids)
    @articles = Article.where(user_id: user_ids, created_at: 24.hour.ago..Time.now)

    article_like_count = @articles.joins(:likes).group(:article_id).count
    article_liked_ids = Hash[article_like_count.sort_by{ |_, v| v }.reverse].keys
    #Hash[article_like_count.sort_by{ |_, v| -v }].keysでも可能。
    @article_rankings= Article.find(article_liked_ids)


  end
end

