require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters'" do
    it "Then I see the name of each shelter in the system" do
      shelter_1 = Shelter.create({name: 'DFL',
                                  address: '123 lane',
                                  city: 'Oakland',
                                  state: 'CA',
                                  zip: '123456'
                                  })

    visit '/shelters'

    expect(page).to have_content('Shelters')
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_link(shelter_1.name)
    end
  end
end
