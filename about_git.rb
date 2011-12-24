#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutGit < EdgeCase::Koan

  # check git initialization
  # you should execute "git init" inside rails app root
  def test_git_init
    in_external_dir "../firstapp" do
      assert_equal "On branch", `git status`[/On branch/]
    end
  end

end
