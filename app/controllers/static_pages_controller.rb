class StaticPagesController < ApplicationController

  def show
    @static_page = StaticPage.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @static_page }
    end
  end

end