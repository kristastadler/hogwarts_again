require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the professors index page and see professors names, ages, and specialties" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")


    visit "/professors"

    within "#professor-#{snape.id}" do
      expect(page).to have_content("Name: #{snape.name}")
      expect(page).to have_content("Age: #{snape.age}")
      expect(page).to have_content("Specialty: #{snape.specialty}")
    end

    within "#professor-#{hagarid.id}" do
      expect(page).to have_content("Name: #{hagarid.name}")
      expect(page).to have_content("Age: #{hagarid.age}")
      expect(page).to have_content("Specialty: #{hagarid.specialty}")
    end

    within "#professor-#{lupin.id}" do
      expect(page).to have_content("Name: #{lupin.name}")
      expect(page).to have_content("Age: #{lupin.age}")
      expect(page).to have_content("Specialty: #{lupin.specialty}")
    end

  end
end 
