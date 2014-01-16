require "test_helper"

feature "Editing a Post" do
  scenario "Submit updates to an existing post" do
    visit post_path(posts(:cr).id)
    click_on "Edit"
    fill_in "Title", with: posts(:mvc).title
    click_on "Update Post"
    page.text.must_include "Post was successfully updated"
    page.text.must_include posts(:mvc).title
  end
end
