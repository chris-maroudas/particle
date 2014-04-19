module ApplicationHelper

  def menu_link_for(node)
    parameters = { controller: node.node_type.controller, action: node.node_type.action }
    parameters.merge!(id: node.optional_field) unless node.optional_field.blank?
    link_to node.name, url_for(parameters)
  end


end
