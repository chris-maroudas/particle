class RatingsController < ApplicationController

  def create
    if current_user
      @rating = current_user.ratings.new(params[:rating])
      if @rating.valid?
        @rating.save
        redirect_to Article.find(params[:rating][:article_id]), success: "Comment posted succesfuly"
      else
        redirect_to Article.find(params[:rating][:article_id]), alert: "Enter a valid rating"
      end
    else
      redirect_to root_url, alert: "You need to be logged in to post a rating!"
    end
  end

end