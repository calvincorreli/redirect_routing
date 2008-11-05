module RedirectRouting
  module Routes
    def redirect(path, *args)
      connect path, :controller => "redirect_routing", :action => "redirect", :conditions => { :method => :get }, :args => args
    end
  end
end