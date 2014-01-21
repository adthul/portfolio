require "test_helper"

feature "add a portfolio item to display work" do
   scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3, sqlite3, PostgresQL, JavaScript"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Portfolio"
    page.text.must_include "Rails"
  end
end
