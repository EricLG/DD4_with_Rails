class ArticlesController < ApplicationController
  layout 'no_sidebloc'
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path @article
    else
      render :new
    end
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    if @article.update(article_params)
      redirect_to article_path @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :texte
    )
  end
end
