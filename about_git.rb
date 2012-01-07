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

  # execute "git add ." to add all files to staging
  def test_git_add
    
    if enabled_test_git_add?

      in_external_dir "../firstapp" do
        assert_equal "new file:   Gemfile", `git status`[/new file:   Gemfile/]
      end
    
    end
    
    assert !enabled_test_git_add?
    
  end
  
  def enabled_test_git_add?
    false
  end
  
  # execute
  #           git -a -m "first commit"
  # to add all files to master branch of local git repo
  def test_commit
    in_external_dir "../firstapp" do
      assert_equal "nothing to commit", `git status`[/nothing to commit/]
    end
  end

  # set your name and email for git commits using commands
  #      git config --global user.name "Firstname Lastname"
  #      git config --global user.email "your_email@youremail.com"
  def test_git_user_name
    in_external_dir "../firstapp" do
      assert_equal "Aleksey Drobnych\n", `git config --global user.name`
    end
  end
  
  def test_git_user_email
    in_external_dir "../firstapp" do
      assert_equal "adrobnych@gmail.com\n", `git config --global user.email`
    end
  end
  
  # connect to remote repository name "origin":
  #       git remote add origin git@github.com:YOUR_USER/firstapp.git
  #       git push -u origin master
  
  # check if you connected to remote git repo named "origin"
  def test_origin
    
    github_user_name = "adrobnych"
    in_external_dir "../firstapp" do
      assert_equal "Fetch URL: git@github.com:adrobnych/firstapp.git", `git remote show origin`[/Fetch URL: git@github.com:#{github_user_name}\/firstapp.git/]
    end
  end


end
