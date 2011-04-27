module ActionController
  module XmlHttpRequestWithIframeRequestSupport
    
    def self.included(base) #:nodoc:
      base.class_eval <<-END_OF_RUBY
        alias_method_chain :xml_http_request?, :iframe_request_support
        alias_method :xhr?, :xml_http_request? 
      END_OF_RUBY
    end
    
    def iframe_request?
      params[:_iframe]
    end
    
    def xml_http_request_with_iframe_request_support?
      xml_http_request_without_iframe_request_support? || iframe_request?
    end
    
  end
end
