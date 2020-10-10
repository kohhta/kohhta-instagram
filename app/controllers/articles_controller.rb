class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Post now!!'
    else
      render :new
      flash.now[:error] = 'Posting failure'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if  @article.update(article_params)
      redirect_to article_path(@article), notice: 'Edit now!!'
    else
      render :new
      flash.now[:error] = 'Edit error...'
    end
  end
  
  
  

  private
  def article_params
    params.require(:article).permit(:content)
  end

end
