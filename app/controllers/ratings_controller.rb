class RatingsController < ApplicationController

  def create
    if current_user
      @rating = current_user.ratings.new(params[:rating])
      if @rating.valid?
        @rating.save
        redirect_to @rating.article, success: "Comment posted succesfuly"
      else
        redirect_to @rating.article, notice: "Enter a valid rating"
      end
    else
      redirect_to root_url, notice: "You need to be logged in to post a rating!"
    end
  end

end
