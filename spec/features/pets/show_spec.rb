require 'rails_helper'

describe  'As a visitor' do
  describe "When I visits '/pets/:id'" do
    it "Then I see the pet with that id including the pet's image, name, description, approximate age, sex and adoptable/pending adoption status" do
      shelter_1 = Shelter.create({name: 'DFL',
                                  address: '123 lane',
                                  city: 'Oakland',
                                  state: 'CA',
                                  zip: '123456'
                                  })
      samson = Pet.create!({
        image: 'URL of image',
        name: 'Samson',
        approximate_age: '4',
        sex: 'Male',
        located_at_shelter: "id from shelters table"
        })

    visit "/pets/#{samson.id}"

    expect(page).to have_content(samson.image)
    expect(page).to have_content(samson.name)
    expect(page).to have_content(samson.located_at_shelter)
    expect(page).to have_content(samson.adoption_status)
    end
  end
end
