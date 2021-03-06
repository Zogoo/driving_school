# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.find_or_create_by!(name: 'Example Co.,ltd')

student = User.find_or_initialize_by(email: 'student@example.com')
student.password = '!QAZ2wsx'
student.build_profile(
  family_name: 'Borjigon',
  first_name: 'Student',
  last_name: 'Test',
  registration_number: 'TI99112233',
  gender: 'male',
  birthday: Date.parse('19991122'),
  mobile_number: '99010203',
  tel_number: '31010203',
  home_address: 'Ub, Chingeltei, Apartment 11-22',
  work_address: 'Hunnu mall',
  portrait: Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/images/sample.jpeg'), 'image/jpg')
)
student.build_student(
  company_id: company.id,
  status: :active,
  start: 1.year.ago,
  finish: 2.years.from_now
)
student.skip_confirmation!
student.save!

teacher = User.find_or_initialize_by(email: 'teacher@example.com')
teacher.password = '!QAZ2wsx'
teacher.build_profile(
  family_name: 'Hothoid',
  first_name: 'Teacher',
  last_name: 'Test',
  registration_number: 'TZ65010343',
  gender: 'male',
  birthday: Date.parse('19650103'),
  mobile_number: '96960102',
  tel_number: '31010203',
  home_address: 'Ub, Han uul, Maihant 103-22',
  work_address: 'Ub tower',
  portrait: Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/images/sample.jpeg'), 'image/jpg'),
)
teacher.build_teacher(
  company_id: company.id,
  status: :active,
  title: 'Durmiin bagsh',
  experience: '5 years more',
  level: :professional
)
teacher.skip_confirmation!
teacher.save!