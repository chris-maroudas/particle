class Node < ActiveRecord::Base
  attr_accessible :menu_id, :name, :node_type_id, :optional_field, :position

  belongs_to :menu
  belongs_to :node_type

end
