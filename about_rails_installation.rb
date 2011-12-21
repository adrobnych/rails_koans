#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutRailsInstallation < EdgeCase::Koan
  
  # To install Rails 3 prerequisites on Windows see
  #   http://railsinstaller.org/
  #
  # ... on Linux or OS X see
  #   http://ruby.railstutorial.org/samples?file=rails_installation_mac_os_x_linux.zip
 
  # You must have valid Ruby version 
  def test_valid_ruby_version
    assert_equal true, is_version_valid?
  end
  
  # according to official Rails website
  # it is recommended to use Ruby versions 1.8.7 or 1.9.2
  def is_version_valid?
    ["1.8.7", "1.9.2"].include? RUBY_VERSION
  end
  
  # rubygems should be installed
  def test_rubygems_presense
    assert_equal "1.7.2", `gem --version`[/\d+.\d+.\d+/]          
  end
  
  # git should be installed
  def test_git_presense
    assert_equal "1.7.6", `git --version`[/\d+.\d+.\d+/]          
  end
  
  # sqlite should be installed
  def test_sqlite_presense
    assert_equal "3.7.3", `sqlite3 --version`[/\d+.\d+.\d+/]          
  end
  
  # bundler should be installed
  def test_bundler_presense
    assert_equal "1.0.21", `bundle --version`[/\d+.\d+.\d+/]          
  end
  
  # rails should be installed
  def test_rails_presense
    assert_equal "3.1.1", `rails --version`[/\d+.\d+.\d+/]          
  end
  
  # we'll use rails 3 for the following tests
  def test_rails_platform
    assert_equal "3", `rails --version`[/\d+/]
  end
end
