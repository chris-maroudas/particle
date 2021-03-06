# == Schema Information
#
# Table name: nodes
#
#  id             :integer          not null, primary key
#  menu_id        :integer
#  node_type_id   :integer
#  position       :integer
#  name           :string(255)
#  optional_field :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Node < ActiveRecord::Base
  attr_accessible :menu_id, :name, :node_type_id, :optional_field, :position

  # Associations
  belongs_to :menu
  belongs_to :node_type

  # Validations
  validates :position,
            numericality: { only_integer: true },
            inclusion: { in: 1..10 },
            presence: true

  default_scope order("position asc")

end
