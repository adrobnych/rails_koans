#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutRailsServer < EdgeCase::Koan

  # execute "rails s" 
  
  # check default rails page
  
  # check is everything OK with db connection
  
  # add another static page
  def test_another_static_page
    # assert_equals( get_content_of_page page, "this is another static page" 
    # hint: create page.html file in public directory
    # and feed it with the following text: "this is another static page"
  end

 
end
