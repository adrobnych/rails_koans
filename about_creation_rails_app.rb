#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutCeationRailsApp < EdgeCase::Koan

  # execute "rails new firstapp" inside parent directory of rails_koans directory
  # and check if firstapp directory was created
  def test_rails_new_app
    rails_app_directory = Dir.open "../firstapp"
    assert_equal "../firstapp", rails_app_directory.to_path
  end
  
  # check rails root directory layout
  def test_standard_entries_of_rails_root
    rails_app_directory = Dir.open "../firstapp"
    assert_equal [".",   "..",   ".gitignore",   "app",   "config",
                  "config.ru",   "db",   "doc",   "Gemfile",   "Gemfile.lock",
                  "lib",   "log",   "public",   "Rakefile",   "README",
                  "script",   "test",   "tmp",   "vendor"], rails_app_directory.entries
  end
  
  # check rails root subdirectories
  def test_rails_subdirectories
    rails_app_directory = Dir.open("../firstapp")
    assert_equal  [".",   "..",   "app",   "config",   "db",   "doc",   "lib",
                   "log",   "public",   "script",   "test",   "tmp",   "vendor"],
                rails_app_directory.entries.select {|e| File.directory? "../firstapp/#{e}"}
  end
  
end
