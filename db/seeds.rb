require "open-uri"

Pet.destroy_all
User.destroy_all

seller_data = []
20.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  user = User.create!({
    first_name: first,
    last_name: last,
    address: Faker::Address.street_address,
    email: "#{first[0]}_#{last}@example.com".downcase,
    password: "123123",
    phone_number: Faker::PhoneNumber.phone_number,
    birthday: Faker::Date.between(from: 40.years.ago, to: 18.years.ago)
  })
  seller_data << user
  puts user.email
end

random_pet_category = %w[dog cat fish bird rodent amphibian reptile others]
random_pet_breed = ["cur", "gatinho miado", "cachorro de rua", "jacaré do papo amarelo", "nemo","pernalonga"]

pet_pics = ["https://www.itl.cat/pngfile/big/325-3250249_1584-golden-retriever-dog-puppy-wallpaper-beautiful-golden.jpg", "https://th.bing.com/th/id/R.786653caa036289ba5978f8a2838bddb?rik=Jace9ATfPow9Cg&riu=http%3a%2f%2fimages6.fanpop.com%2fimage%2fphotos%2f39300000%2fDog-dogs-39323649-1440-900.jpg&ehk=2j5hJZOGQYQL6IK9FydtWO%2fMjeCvMXSLLgWS2j9jERE%3d&risl=&pid=ImgRaw&r=0"]

3.times do
  pet_data = {
    name: Faker::Name.first_name,
    category: random_pet_category.sample,
    birthday: Faker::Date.between(from: 8.years.ago, to: Date.today),
    description: Faker::ChuckNorris.fact,
    breed: random_pet_breed.sample
  }
  pet = Pet.new(pet_data)
  file = URI.open(pet_pics.sample)
  random_seller = seller_data.sample
  pet.seller = random_seller
  pet.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  pet.save!

end
puts "seed completed"
