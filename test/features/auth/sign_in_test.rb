require "test_helper"

feature "sign in existing user" do
  scenario "sign into a user session when 'Sign in' link is clicked" do
    sign_in

    page.must_have_content "Signed in successfully."
  end
end
