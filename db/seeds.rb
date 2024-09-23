# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Started Seeding Admin'
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

puts 'Started seeding Events'
# db/seeds.rb

# Event 1: Golden Bridge Expo
Event.create!(
  title: 'Golden Bridge Expo',
  image: 'https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fbba983dc-7f77-4987-9427-48991b952479_1600x1066.jpeg',
  tag: 'Trade Show',
  profiles: [
    'https://example.com/profile1.jpg',
    'https://example.com/profile2.jpg',
    'https://example.com/profile3.jpg',
    'https://example.com/profile4.jpg',
    'https://example.com/profile5.jpg'
  ],
  date: '2024-09-19 09:00:00',
  location: 'Sandton Convention Centre, Johannesburg, South Africa',
  price: 'Check Official Website',
  categories: '#TradeShow',
  link: 'https://10times.com/e1x4-f3z2-d3gr'
)

# Event 2: Africa Technology Show (AFTS) Kenya 2024
Event.create!(
  title: 'Africa Technology Show (AFTS) Kenya 2024',
  image: 'https://hk-sitescms-1251659875.cos.ap-hongkong.myqcloud.com/africatechshow/upload/images/2023/12/6d5ecc9915afb5e0.png',
  tag: 'International Exhibition',
  profiles: [
    'https://example.com/profile1.jpg',
    'https://example.com/profile2.jpg',
    'https://example.com/profile3.jpg',
    'https://example.com/profile4.jpg',
    'https://example.com/profile5.jpg'
  ],
  date: '2024-10-02 09:00:00',
  location: 'Edge Convention Centre, Nairobi, Kenya',
  price: 'Free / Apply/register online',
  categories: '#SmartCities #Fintech #ConsumerTechnology #Industry4.0',
  link: 'https://africatechshow.com/'
)

# Event 3: AAE 2025 - 8th Africa Agri Expo
Event.create!(
  title: 'AAE 2025 - 8th Africa Agri Expo',
  image: 'https://africa-agriexpo.com/assets/images/logo/02_logo.png',
  tag: 'Agriculture Expo',
  profiles: [
    'https://africa-agriexpo.com/assets/images/blog/01_blog.jpg',
    'https://example.com/profile2.jpg',
    'https://example.com/profile3.jpg',
    'https://example.com/profile4.jpg',
    'https://example.com/profile5.jpg'
  ],
  date: '2025-02-19 09:00:00',
  location: 'Kenyatta International Convention Centre (KICC), Nairobi, Kenya',
  price: 'Trade & general public',
  categories: '#Agriculture #AgriExpo',
  link: 'https://africa-agriexpo.com/'
)

puts "Done seeding events"