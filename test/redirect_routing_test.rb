require File.dirname(__FILE__) + '/test_helper'

class EventsController < ActionController::Base
end
ActionController::Routing::Routes.add_route('/:controller/:action/:id')

class RedirectRoutingTest < Test::Unit::TestCase

  def setup
    @controller = RedirectRoutingController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_redirect_routes
    with_routing do |set|
      set.draw do |map|
        map.redirect '', :controller => 'events'
        map.redirect 'test', 'http://pinds.com'
        map.redirect 'oldurl', 'newurl', :permanent => true
      end
      
      assert_recognizes({ :controller => "redirect_routing", :action => "redirect", :args => [{ 'controller' => "events" }] }, "/")
      assert_recognizes({ :controller => "redirect_routing", :action => "redirect", :args => ["http://pinds.com"] }, "/test")
      assert_recognizes({ :controller => "redirect_routing", :action => "redirect", :args => ["newurl", {'permanent' => true}] }, "/oldurl")
    end
  end
  
  def test_redirect_controller_with_hash
    get :redirect, :args => [{ :controller => "events" }]
    assert_redirected_to :controller => "events"
    assert_response 302
  end
  
  def test_redirect_controller_with_string
    get :redirect, :args => ["http://pinds.com"]
    assert_redirected_to "http://pinds.com"
    assert_response 302
  end

  def test_permanent_redirect_controller_with_hash
    get :redirect, :args => [{ :controller => "events", :permanent => true }]
    assert_redirected_to :controller => "events"
    assert_response 301
  end
  
  def test_permanent_redirect_controller_with_string
    get :redirect, :args => ["http://pinds.com", { :permanent => true }]
    assert_redirected_to "http://pinds.com"
    assert_response 301
  end
end
