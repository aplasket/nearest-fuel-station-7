require "rails_helper"

RSpec.describe "/, root path" do
  describe "as a user, when i visit root path" do
    it "I select 'Griffin Coffee' form the start location drop down", :vcr do
      visit root_path

      expect(page).to have_content("Nearest Fuel Station")
      expect(page).to have_content("Search For The Nearest Electric Charging Station")
      expect(page).to have_button("Find Nearest Station")

      click_on "Find Nearest Station"

      expect(current_path).to eq(search_path)
    end
  end
end