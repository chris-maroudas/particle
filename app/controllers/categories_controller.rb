class CategoriesController < ApplicationController

  load_and_authorize_resource

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

  def index
    @categories = Category.all
  end

end
