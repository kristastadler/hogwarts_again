require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit a professor show page and see the average age of all students for that professor" do

    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create!(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create!(student_id: harry.id, professor_id: hagarid.id)
    ProfessorStudent.create!(student_id: harry.id, professor_id: lupin.id)
    ProfessorStudent.create!(student_id: malfoy.id, professor_id: hagarid.id)
    ProfessorStudent.create!(student_id: malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create!(student_id: longbottom.id, professor_id: snape.id)

  visit "/professors/#{snape.id}'"

    expect(page).to have_content("Average Age: #{snape.students.average_age}")

  visit "/professors/#{hagarid.id}'"

    expect(page).to have_content("Average Age: #{hagarid.students.average_age}")

  visit "/professors/#{lupin.id}'"

    expect(page).to have_content("Average Age: #{lupin.students.average_age}")

  end
end
