class MediaGalleriesController < ApplicationController

  load_and_authorize_resource

  def show
    @gallery = MediaGallery.find(params[:id])
    @assets = @gallery.assets
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
    end
  end


end



