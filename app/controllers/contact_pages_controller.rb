class ContactPagesController < ApplicationController

  def show
    @contact_page = ContactPage.find_by_id(:id)
  end

end
