require "rails_helper"

RSpec.describe "/search" do
  describe "as a user on the search page" do
    it "displays the closest electric fuel station", :vcr do
      visit root_path
      page.select("Griffin Coffee", :from => "location")

      click_on "Find Nearest Station"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Name:")
      expect(page).to have_content("Address:")
      expect(page).to have_content("Fuel Type:")
      expect(page).to have_content("Access Times:")
      expect(page).to have_content("Distance:")
      expect(page).to have_content("Travel Time:")
      expect(page).to have_content("Directions:")
    end
  end
end