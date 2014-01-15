require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  def test_homepage_has_content
    visit root_path
    page.must_have_content "Andy Thul"
  end
end
