# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Started Seedind Admin'
User.create(
  first_name: 'Admin',
  last_name: 'User',
  name: 'Admin Super',
  email: 'kiplangatisack.is@gmail.com',
  contact: '+1234567890',
  address: '123 Admin Street',
  city: 'Admin City',
  state_province: 'Admin State',
  password: '@123Admin', # Replace with a secure password
  password_confirmation: '@123Admin', # Replace with a secure password
  role: 'admin'
)

puts 'Done seeding'
