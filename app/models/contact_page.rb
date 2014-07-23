# == Schema Information
#
# Table name: contact_pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactPage < ActiveRecord::Base
  attr_accessible :content, :title
end
