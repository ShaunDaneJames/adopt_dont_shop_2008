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

describe "As a visitor" do
  describe "When I visit '/shelters/:id/pets'" do
    it "Then I see each Pet that can be adobpted form that Shelter
     with that shelter_id including the
     Pet's image, name, approximate age, and sex" do
     shelter_1 = Shelter.create({name: 'DFL',
                                 address: '123 lane',
                                 city: 'Oakland',
                                 state: 'CA',
                                 zip: '123456'
                                 })
     toby = Pet.create({image: "URL",
                        name: "Toby",
                        approximate_age: "2",
                        sex: "Male",
                        located_at_shelter: "DFL",
                        adoption_status: "Available"
                        })
     pete = Pet.create({image: "URL",
                        name: "Pete",
                        approximate_age: "2",
                        sex: "Male",
                        located_at_shelter: "DFL",
                        adoption_status: "Pending"
                        })

     visit "/shelters/#{shelter_1.id}/pets"

     expect(page).to have_content(toby.image)
     expect(page).to have_content(toby.name)
     expect(page).to have_content(toby.approximate_age)
     expect(page).to have_content(toby.sex)
     expect(page).not_to have_content(pete.name)
    end
  end
end
