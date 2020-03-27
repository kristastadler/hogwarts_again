class Student <ApplicationRecord
  validates_presence_of :name, :age, :house

  has_many :professor_students
  has_many :professors, through: :professor_students

  def self.average_age
    student_ages = 0
    Student.all.each do |student|
      student_ages += student.age
    end
    average = student_ages.to_f / Student.count
    average.round(2)
  end
  end
