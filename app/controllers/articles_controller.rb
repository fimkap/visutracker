class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @articles_count = Article.count
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    #@article = Article.new(article_params)
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to articles_url
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private 
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
