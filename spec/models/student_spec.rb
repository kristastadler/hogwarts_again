require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe 'class methods' do
    it '.average_age' do
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

    expect(Student.average_age).to eq(11.33)
    expect(snape.students.average_age).to eq(11)
    expect(lupin.students.average_age).to eq(11.5)
  end
end   

end
