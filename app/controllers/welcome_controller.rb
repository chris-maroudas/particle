class WelcomeController < ApplicationController

  def index
    @banner = Banner.first
    @images = (@banner.banner_images if @banner && @banner.banner_images) || []

  end

end
