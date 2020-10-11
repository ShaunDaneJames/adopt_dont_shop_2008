require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the Shelter Index page" do
    it "Then I see a link to create a new Shelter" do

      visit '/shelters'

      expect(page).to have_link('New Shelter')
      click_link 'New Shelter'

      expect(current_path).to eq('/shelters/new')

      fill_in 'name', with: 'shelter_test'
      fill_in 'address', with: '123_test_lane'
      fill_in 'city', with: 'city_test'
      fill_in 'state', with: 'state_test'
      fill_in 'zip', with: 12345
      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content('shelter_test')
    end
  end
end
