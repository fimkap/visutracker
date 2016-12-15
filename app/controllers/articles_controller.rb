class ArticlesController < ApplicationController
    before_action :authenticate_user!

    def index
        @articles = Article.all
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
      @article = Article.new(article_params)

      if @article.save
          redirect_to @article
      else
          render 'new'
      end
	end

    private 
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
