require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts" do
    visit post_path(posts(:cr).id)
    page.text.must_include posts(:cr).title
  end
end
