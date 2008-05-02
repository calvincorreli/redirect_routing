module RedirectRouting
  module Routes
    def redirect(path, *args)
      connect path, :controller => "redirect_routing", :action => "redirect", :args => args
    end
  end
end
