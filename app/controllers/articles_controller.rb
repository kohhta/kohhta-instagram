class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def index
    @articles = Article.all.order(:id)
  end

  def show
    @comments = @article.comments
    @comment = Comment.new
  end
  
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params) 
    if @article.save
      redirect_to article_path(@article), notice: '投稿しました'
    else
      render :new
      flash.now[:error] = '投稿できませんでした'
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if  @article.update(article_params)
      redirect_to article_path(@article), notice: '編集しました!!'
    else
      render :new
      flash.now[:error] = '編集できませんでした'
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def article_params
    params.require(:article).permit(:content, :eyecatch, :images)

  end

  def set_article
    @article = Article.find(params[:id])
  end

end
