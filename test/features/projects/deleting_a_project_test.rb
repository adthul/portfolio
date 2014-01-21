require "test_helper"

feature "delete a project" do
  scenario "removing project data by clicking 'delete'" do
    project = projects(:portfolio).name
    visit projects_path

    page.find("a[href='#{project_path(projects(:portfolio))}'][data-method='delete']").click
    page.wont_have_content project
  end
end
