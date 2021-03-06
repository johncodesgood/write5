class ArticlesController < ApplicationController
 
  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      current_user.articles << article
      redirect_to "/users/#{current_user.id}"
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])  
  end

  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to "/users/#{current_user.id}"
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to "/users/#{current_user.id}"
  end

  private

    def article_params
      params.require(:article).permit(:title, :text)
    end
  
end
