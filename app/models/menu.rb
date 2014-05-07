# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menu < ActiveRecord::Base
  attr_accessible :name, :position
  has_many :nodes
end
