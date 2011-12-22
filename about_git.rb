#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutGit < EdgeCase::Koan

  # check git initialization
  # you should execute "git init" inside rails app root
  def test_git_init
    koans_dir = Dir.pwd
    Dir.chdir "../firstapp"
    git_result = `git status`
    Dir.chdir koans_dir
    assert_equal "On branch", git_result[/On branch/]
  end

end
