require "test_helper"

feature "Editing a Post" do
  scenario "author can add updates to an existing post" do
    sign_in(:author)

    visit post_path(posts(:mvc))
    click_on "Edit"
    fill_in "Title", with: posts(:cr).title
    click_on "Update Post"
    page.text.must_include "Post was successfully updated"
    page.text.must_include posts(:cr).title
  end

  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Err"
    click_on "Update Project"
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end
