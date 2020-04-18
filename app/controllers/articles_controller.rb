class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path, notice: 'Article was successfully created.'
  end

  def destroy
    @article = Article.find(params[:id]).destroy
    redirect_to articles_url
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
