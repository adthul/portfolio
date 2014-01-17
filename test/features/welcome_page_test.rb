require "test_helper"

feature "visit domain" do
	scenario "view domain homepage in browser" do
		visit "https://localhost:3000"
		page.text.must_include "Andy Thul"
	end
end
