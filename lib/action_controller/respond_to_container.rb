module ActionController
  module RespondToContainer
    
    def container(container, &block)
      js do
        @controller.instance_variable_set(:@js_sublayout, container)
        begin
          result = block_given? ? yield : @controller.send(:render_to_string)
        ensure
          @controller.response.content_type = nil
          @controller.send(:erase_render_results)
          @controller.send(:reset_variables_added_to_assigns)
        end
        result = "jQuery('\##{container}').replaceWith(#{ActiveSupport::JSON.encode(result)}); jQuery.initAll('\##{container}');"
        if @controller.request.iframe_request?
          @controller.send(:render, :js => "<textarea>#{result}</textarea>", :content_type => 'text/html; charset=utf-8')
        else
          @controller.send(:render, :js => result, :content_type => 'text/javascript; charset=utf-8')
        end
      end
    end
    
  end
end
