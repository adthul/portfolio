require "test_helper"

feature "Visiting the Post Index" do
  scenario "showing existing posts" do
    visit post_path(posts(:cr))
    page.text.must_include posts(:cr).title
  end
end
