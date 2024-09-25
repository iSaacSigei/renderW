# Ensure seeding is idempotent

puts 'Started Seeding Admin'

User.find_or_create_by!(email: 'kiplangatisack.is@gmail.com') do |user|
  user.first_name = 'Admin'
  user.last_name = 'User'
  user.name = 'Admin Super'
  user.contact = '+1234567890'
  user.address = '123 Admin Street'
  user.city = 'Admin City'
  user.state_province = 'Admin State'
  user.password = '@123Admin' # Replace with a secure password
  user.password_confirmation = '@123Admin' # Replace with a secure password
  user.role = 'admin'
end

puts 'Done seeding admin'

puts 'Started seeding Events'

# Event 1: Golden Bridge Expo
Event.find_or_create_by!(title: 'Golden Bridge Expo') do |event|
  event.image = 'https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fbba983dc-7f77-4987-9427-48991b952479_1600x1066.jpeg'
  event.tag = 'Trade Show'
  event.profiles = [
    'https://example.com/profile1.jpg',
    'https://example.com/profile2.jpg',
    'https://example.com/profile3.jpg',
    'https://example.com/profile4.jpg',
    'https://example.com/profile5.jpg'
  ]
  event.date = '2024-09-19 09:00:00'
  event.location = 'Sandton Convention Centre, Johannesburg, South Africa'
  event.price = 'Check Official Website'
  event.categories = '#TradeShow'
  event.link = 'https://10times.com/e1x4-f3z2-d3gr'
end

# Event 2: Africa Technology Show (AFTS) Kenya 2024
Event.find_or_create_by!(title: 'Africa Technology Show (AFTS) Kenya 2024') do |event|
  event.image = 'https://hk-sitescms-1251659875.cos.ap-hongkong.myqcloud.com/africatechshow/upload/images/2023/12/6d5ecc9915afb5e0.png'
  event.tag = 'International Exhibition'
  event.profiles = [
    'https://example.com/profile1.jpg',
    'https://example.com/profile2.jpg',
    'https://example.com/profile3.jpg',
    'https://example.com/profile4.jpg',
    'https://example.com/profile5.jpg'
  ]
  event.date = '2024-10-02 09:00:00'
  event.location = 'Edge Convention Centre, Nairobi, Kenya'
  event.price = 'Free / Apply/register online'
  event.categories = '#SmartCities #Fintech #ConsumerTechnology #Industry4.0'
  event.link = 'https://africatechshow.com/'
end

# Event 3: AAE 2025 - 8th Africa Agri Expo
Event.find_or_create_by!(title: 'AAE 2025 - 8th Africa Agri Expo') do |event|
  event.image = 'https://africa-agriexpo.com/assets/images/logo/02_logo.png'
  event.tag = 'Agriculture Expo'
  event.profiles = [
    'https://africa-agriexpo.com/assets/images/blog/01_blog.jpg',
    'https://example.com/profile2.jpg',
    'https://example.com/profile3.jpg',
    'https://example.com/profile4.jpg',
    'https://example.com/profile5.jpg'
  ]
  event.date = '2025-02-19 09:00:00'
  event.location = 'Kenyatta International Convention Centre (KICC), Nairobi, Kenya'
  event.price = 'Trade & general public'
  event.categories = '#Agriculture #AgriExpo'
  event.link = 'https://africa-agriexpo.com/'
end

puts "Done seeding events"
