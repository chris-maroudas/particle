class SearchController < ApplicationController
  def show
    if params[:query].present?
      @articles = Article.find_with_index(params[:query], { limit: 10 })
    else
      redirect_to root_url, notice: "Please specify a search query!"
    end
  end
end
