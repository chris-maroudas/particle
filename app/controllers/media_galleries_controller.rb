class MediaGalleriesController < ApplicationController

  load_and_authorize_resource

  def index
    @assets = MediaGallery.first.assets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
    end
  end


end



