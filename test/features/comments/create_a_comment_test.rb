require 'test_helper'

feature 'creating a comment' do
  scenario 'visitor can comment on a post from a post page' do
    create_post_comment
    page.text.must_include "Comment was successfully created"
  end

  scenario 'Visitor can comment on a project from a project page' do
    create_project_comment
    page.text.must_include "Comment was successfully created"
  end
end
