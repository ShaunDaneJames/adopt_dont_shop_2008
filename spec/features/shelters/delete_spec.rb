require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a shelter show page" do
    it "Then I see a link to delete the shelter" do
      shelter_1 = Shelter.create({name: 'DFL',
                                  address: '123 lane',
                                  city: 'Oakland',
                                  state: 'CA',
                                  zip: '123456'
                                  })

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_link('Delete Shelter')
      click_on 'Delete Shelter'

      expect(current_path).to eq("/shelters")
      expect(page).not_to have_content("#{shelter_1.name}")
    end
  end
end
