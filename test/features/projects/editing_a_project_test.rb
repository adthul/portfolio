require "test_helper"

feature "edit a project" do
  scenario "submiting updates to an existing project" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Coolio"
    click_on "Update Project"

    page.text.must_include "success"
    page.text.must_include "Coolio"
    page.text.wont_include "Goolio"
  end
end
