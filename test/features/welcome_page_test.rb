require "test_helper"

feature "visit domain" do
	scenario "view domain homepage in browser" do
		visit "http://www.andrewthul.com"
		page.text.must_include "Andrew Thul"
	end
end
