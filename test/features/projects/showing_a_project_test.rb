require "test_helper"

feature "show individual project" do
  scenario "viewing specific project" do
    visit projects_path(projects(:portfolio))
    page.text.must_include "Timelord"
  end
end
