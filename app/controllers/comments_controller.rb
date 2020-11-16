class CommentsController < ApplicationController

  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def index
    article = Article.find(params[:article_id])
    comments = article.comments
    render json: comments
  end

  def show
  end
  
  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    render json: @comment
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content,:avatar)
  end

end