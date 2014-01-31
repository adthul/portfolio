require 'test_helper'

feature 'creating a comment' do
  scenario 'visitor can comment on a post from a post page' do
    create_comment
    page.text.must_include "Comment was successfully created"
  end
end
