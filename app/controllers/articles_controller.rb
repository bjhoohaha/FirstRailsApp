class ArticlesController < ApplicationController

http_basic_authenticate_with name: "admin",
                             password: "admin",
                             except: [:index, :show]

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def create
    #used to display parameters passed in create ActionController
    #render plain:params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
        # @articles.inspect
        redirect_to @article
    else
        render "new"

    end

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def destroy_multiple
    Article.destroy(params[:article])

    respond_to do |format|
      format.html { redirect_to articles_path }
      format.json { head :no_content }
    end


  end

  private
    def article_params
      params.require(:article).permit(:title, :category, :text, :year)
    end
end
