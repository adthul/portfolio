require "test_helper"

feature "Check for Zurb" do
  scenario "Find Zurb elements on homepage" do
    visit root_path
    page.body.must_include 'columns'
  end
end
