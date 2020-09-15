# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.find_or_create_by!(name: 'Example Co.,ltd')

ActiveRecord::Base.transaction do
  student = User.create!(email: 'student@example.com', password: '!QAZ2wsx')
  student.skip_confirmation!
  byebug
  student.profile.create!(
    family_name: 'Borjigon',
    first_name: 'Student',
    last_name: 'Test',
    registration_number: 'TI99112233',
    gender: 'male',
    birthday: Date.parse('19991122'),
    mobile_number: '99010203',
    tel_number: '31010203',
    home_address: 'Ub, Chingeltei, Apartment 11-22',
    work_address: 'Hunnu mall'
  )
  student.studend.create!(
    company_id: company.id,
    status: :active,
    start: 1.year.ago,
    finish: 2.years.from_now
  )
end


ActiveRecord::Base.transaction do
  teacher = User.create!(email: 'teacher@example.com', password: '!QAZ2wsx')
  teacher.skip_confirmation!
  teacher.profile.create!(
    family_name: 'Hothoid',
    first_name: 'Teacher',
    last_name: 'Test',
    registration_number: 'TZ65010343',
    gender: 'male',
    birthday: Date.parse('19650103'),
    mobile_number: '96960102',
    tel_number: '31010203',
    home_address: 'Ub, Han uul, Maihant 103-22',
    work_address: 'Ub tower'
  )
  teacher.teacher.create!(
    company_id: company.id,
    status: :active,
    title: 'Durmiin bagsh',
    experience: '5 years more',
    level: :professional
  )
end
