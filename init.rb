require 'action_controller/redirect_to_with_xhr_support'
require 'action_controller/redirect_to_facebox'
require 'action_controller/xml_http_request_with_iframe_request_support'
require 'action_controller/respond_to_container'
require 'action_controller/respond_to_facebox'

ActionController::Base.class_eval do
  include ActionController::RedirectToWithXhrSupport
  include ActionController::RedirectToFacebox
end

ActionController::Request.class_eval do
  include ActionController::XmlHttpRequestWithIframeRequestSupport
end

ActionController::MimeResponds::Responder.class_eval do
  include ActionController::RespondToContainer
  include ActionController::RespondToFacebox
end
