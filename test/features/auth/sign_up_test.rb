require "test_helper"

feature "sign up user" do
  scenario "create new user account when new user form is submitted" do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "There was a problem with your sign up"
  end
end
