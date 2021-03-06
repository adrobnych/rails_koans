#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutBundler < EdgeCase::Koan

  # You must have Gemfile 
  def test_gemfile_presense
    rails_app_directory = Dir.open "../firstapp"
    assert rails_app_directory.entries.include? "Gemfile"
  end
  
  # you have to execute "bundle install"
  # inside firstapp directory
  def test_bundle_install_command
    assert_equal :yes, bundle_install_was_executed?
  end
  
  def bundle_install_was_executed?
    :yes
  end
  
  # check if you installed rails 3 gem using bundler
  def test_rails3_gem_installation
    in_external_dir("../firstapp") do
      assert_equal "rails-3.", `bundle show rails`[/rails-3./]
    end
  end
 
  # check if you installed sqilite3 gem using bundler
  def test_sqlite3_gem_installation
    in_external_dir("../firstapp") do
      assert_equal "sqlite3-1.", `bundle show sqlite3`[/sqlite3-1./]
    end
  end
  
end
