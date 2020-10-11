require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a shelter show page' do
    it 'Then I see a link to update the shelter' do
      shelter_1 = Shelter.create({name: 'DFL',
                                  address: '123 lane',
                                  city: 'Oakland',
                                  state: 'CA',
                                  zip: '123456'
                                  })

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_link('Update Shelter')
      click_on 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

      fill_in 'name', with: 'shelter_edit_test'
      fill_in 'address', with: '123_edit_lane'
      fill_in 'city', with: 'edit_test'
      fill_in 'state', with: 'edit_test'
      fill_in 'zip', with: 54321
      click_on 'Update Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content('shelter_edit_test')
    end
  end
end
