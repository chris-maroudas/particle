class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :create_menu_items, :create_sidebar_data

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def create_menu_items
    @menu = Menu.exists? ? Menu.first : []
  end


  def create_sidebar_data
    @recent_articles = Article.recent(3)
    @featured_article = Article.featured.first
    @categories = Category.sorted_by_articles_number
  end

end
