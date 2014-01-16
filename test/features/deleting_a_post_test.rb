require "test_helper"

feature "Deleting a Post" do
  scenario "Post is deleted with a click" do
    visit posts_path
    stuff = posts(:mvc).title
    first(:link, 'Destroy').click
    page.wont_have_content stuff
  end
end
