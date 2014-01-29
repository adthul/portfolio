require "test_helper"

feature "Creating a Post" do
  scenario "author can create a post" do
    sign_in(:author)

    visit new_post_path
    fill_in "Title", with: posts(:mvc).title
    fill_in "Body", with: posts(:mvc).body
    click_on "Create Post"
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:mvc).body
    page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new post button" do
    visit posts_path
    page.wont_have_link "New Post"
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_post_path
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_post_path
    page.must_have_field('Published')
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"
  end
end
