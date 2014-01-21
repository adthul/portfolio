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

  scenario "new project has invalid data" do
    visit new_project_path
    fill_in "Name", with: "2"
    click_on "Create Project"
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
