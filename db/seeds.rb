# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!([{name: 'Lawyer'},{name: 'Finance'},{name: 'Sysadmin'}])

User.create!([{name: Faker::Name.name, email: "lawyer@gmail.com",role_id: Role.find_by(name: 'Lawyer').id,password: "password",password_confirmation: "password"},
    {name: Faker::Name.name, email: "finance@gmail.com",role_id: Role.find_by(name: 'Finance').id,password: "password",password_confirmation: "password"},
    {name: Faker::Name.name, email: "sysadmin@gmail.com",role_id: Role.find_by(name: 'Sysadmin').id,password: "password",password_confirmation: "password"}])

Company.create!([{name: 'MTN'},{name: 'Fidelity'},{name: 'Ecobank'}])