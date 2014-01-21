require "test_helper"

feature "Deleting a Post" do
  scenario "Post is deleted with a click" do
    stuff = posts(:mvc).title
    visit posts_path
    # first(:link, 'Destroy').click
    page.find("a[href='#{post_path(posts(:mvc))}'][data-method='delete']").click
    page.wont_have_content stuff
  end
end
