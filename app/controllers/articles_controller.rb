class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json

  load_and_authorize_resource

  def index
    @articles = Article.published

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @related_articles = @article.get_most_related_articles(3)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

end