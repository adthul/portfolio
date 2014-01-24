require "test_helper"

feature "sign out user" do
  scenario "destroy a user session by clicking on the 'Sign Out' link" do
    sign_in

    click_on "Sign Out"
    page.must_have_content "Signed out successfully."
  end
end
