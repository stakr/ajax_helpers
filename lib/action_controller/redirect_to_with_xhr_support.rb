module ActionController
  module RedirectToWithXhrSupport
    
    def self.included(base) #:nodoc:
      base.class_eval <<-END_OF_RUBY
        alias_method_chain :redirect_to, :xhr_support
      END_OF_RUBY
    end
    
    def redirect_to_with_xhr_support(*args)
      if request.xhr?
        result = render_to_string :update do |page|
          page.redirect_to(*args)
        end
        if request.iframe_request?
          render :js => "<textarea>#{result}</textarea>", :content_type => 'text/html; charset=utf-8'
        else
          render :js => result, :content_type => 'text/javascript; charset=utf-8'
        end
      else
        redirect_to_without_xhr_support(*args)
      end
    end
    
  end
end
