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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article Updated Successfully"
      redirect_to @article
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
