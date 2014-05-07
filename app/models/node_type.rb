# == Schema Information
#
# Table name: node_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  controller :string(255)
#  action     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NodeType < ActiveRecord::Base
  attr_accessible :action, :controller, :name

  has_many :nodes

end
