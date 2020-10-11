require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/:id'" do
    it "Then I see the shelter with that ID including the shelter's
    name, address, city, state, and zip" do
      shelter_1 = Shelter.create({name: 'DFL',
                                  address: '123 lane',
                                  city: 'Oakland',
                                  state: 'CA',
                                  zip: '123456'
                                  })

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
    end
  end
end
