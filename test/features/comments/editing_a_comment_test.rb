require 'test_helper'

feature 'editing a comment' do
  scenario 'author or editor can approve a comment on post' do
    create_post_comment
    sign_in(:author)
    visit post_path(posts(:mvc))
    click_on "Edit"
    page.must_have_field('Approved')
    check "Approved"
    click_on "Update Post"
    page.text.must_include comments(:testcom).content
    page.text.must_include "Comment was successfully created"
    page.text.must_include "Status: Approved"
  end
end
