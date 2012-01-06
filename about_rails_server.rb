#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'open-uri'

class AboutRailsServer < EdgeCase::Koan
 
  # you have to execute "rails s" inside firstapp directory
  def server_up
    false
  end
 
  
  # check if server name is webrick
  def test_server_name
   
    if server_up 
      open 'http://localhost:3000' do |f|
        assert_equal "WEBrick", f.meta["server"][/WEBrick/]
      end
    end
    
  end
  
  # landing page of firstapp includes text "You’re riding Ruby on Rails!"
  def test_landing_page
    
    if server_up
      open 'http://localhost:3000' do |f|
        was_found = false
        f.each do |line|
          if line.include? "You&rsquo;re riding Ruby on Rails!"
            was_found = true
          end
        end
        assert was_found
      end
    end
    
  end
  
  # check if environment is production
  def test_env_page
    
    if server_up
      open 'http://localhost:3000/rails/info/properties' do |f|
        was_found = false
        f.each do |line|
          if line.include? '<tr><td class="name">Environment</td><td class="value">development</td></tr>'
            was_found = true
          end
        end
        assert was_found
      end
    end
    
  end

  # shut down the server and modify server_up method to disable server tests
  def test_server_shutdown
    assert !server_up
  end
end
