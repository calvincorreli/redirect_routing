$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'test/unit'

begin
  RAILS_ENV = "test"
  require File.expand_path(File.join(File.dirname(__FILE__), '../../../../config/environment.rb'))
  require 'action_controller/test_process'
rescue LoadError
  puts "\n[!] Tests only run when the plugin is installed in the plugins directory, running the tests against anything other than your particular Rails version doesn't really serve a purpose."
  exit
end
