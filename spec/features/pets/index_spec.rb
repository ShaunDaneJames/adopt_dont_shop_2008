require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/pets'" do
    it "Then I see each pet in the system including the Pet's data" do
      samson = Pet.create!({
        image: 'URL of image',
        name: 'Samson',
        approximate_age: '4',
        sex: 'Male',
        located_at_shelter: "id from shelters table"
        })

      visit '/pets'

      expect(page).to have_content('URL of image')
      expect(page).to have_content('Samson')
    end
  end
end
