module ApplicationHelper

  def menu_link_for(node)
    parameters = { controller: node.node_type.controller, action: node.node_type.action }
    parameters.merge!(id: node.optional_field) unless node.optional_field.blank?
    begin
      link_to node.name, url_for(parameters)
    rescue ActionController::RoutingError
      "" # Devise namespace bugs the link. Fix coming.
    end


  end


end
