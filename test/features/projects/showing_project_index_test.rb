require "test_helper"

feature "show project index" do
  scenario "viewing all projects" do
    visit projects_path
    page.text.must_include "Timelord"
    page.text.must_include "Handy App"
  end
end
