module ActionController
  module RedirectToFacebox
    
    def redirect_to_facebox(*args)
      result = render_to_string :update do |page|
        page.call('jQuery.facebox', :ajax => url_for(*args))
      end
      if request.iframe_request?
        render :js => "<textarea>#{result}</textarea>", :content_type => 'text/html; charset=utf-8'
      else
        render :js => result, :content_type => 'text/javascript; charset=utf-8'
      end
    end
    
  end
end
