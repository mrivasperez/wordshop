class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article Created Successfully"
      redirect_to @article
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
