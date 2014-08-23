class SearchController < ApplicationController
  def show
    if params[:query].present?
      @search_term = params[:query]
      @articles = Article.find_with_index(@search_term, { limit: 10 })
    else
      redirect_to root_url, notice: "Please specify a search query!"
    end
  end
end
