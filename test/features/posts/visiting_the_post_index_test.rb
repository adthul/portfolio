require "test_helper"

feature "Visiting the Post Index" do
  scenario "showing existing posts" do
    visit posts_path
    page.text.must_include posts(:cr).title
  end

  scenario "showing all current user's posts" do
    sign_in(:author)
    visit posts_path
    click_on "Show My Posts"
    page.text.must_include posts(:mvc).title
    page.text.wont_include posts(:cr).title
  end
end
