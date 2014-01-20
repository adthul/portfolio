require "test_helper"

feature "Check for Zurb" do
  scenario "Find Zurb elements on homepage" do
    visit root_path
    page.source.must_include("foundation.js")
  end
end
