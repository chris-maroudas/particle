class WelcomeController < ApplicationController
  def index
    @banner = Banner.first || []
  end
end
