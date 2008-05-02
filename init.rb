require 'redirect_routing'

# Wheeee! Monkey-patching!

ActionController::Routing::RouteSet::Mapper.send :include, RedirectRouting::Routes
