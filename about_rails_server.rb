#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'open-uri'

class AboutRailsServer < EdgeCase::Koan

  # you have to execute "rails s" inside firstapp directory
  
  # check if server name is webrick
  def test_server_name
    open 'http://localhost:3000' do |f|
      assert_equal "WEBrick", f.meta["server"][/WEBrick/]
    end  
  end
  
  # landing page of firstapp includes text "You’re riding Ruby on Rails!"
  def test_lnding_page
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
  
  # check if environment is production
  def test_lnding_page
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
