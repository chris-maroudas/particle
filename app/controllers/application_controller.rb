class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :create_menu_items


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def create_menu_items
    @menu = Menu.exists? ? Menu.first : []
  end


  #def create_sidebar_data
  #  @sidebar_post3819313a
  # Post.featured
  #end

end
