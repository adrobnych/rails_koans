#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutBundler < EdgeCase::Koan

  # You must have Gemfile 
  def test_gemfile_presense
    rails_app_directory = Dir.open "../firstapp"
    assert rails_app_directory.entries.include? "Gemfile"
  end
  
  # you must have rails gem in Gemfile
  def test_rails_gem_presence_in_gemfile
    
    
  end
  
  # you must have sqlite gem in Gemfile
  
  # execute "bundle install"
  
  # veryfy if bundler loaded gems successfuly
  
  
 
end
