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
end

random_pet_category = %w[dog cat fish bird rodent amphibian reptile others]
random_pet_breed = ["cur", "gatinho miado", "cachorro de rua", "jacaré do papo amarelo", "nemo","pernalonga"]


20.times do
  pet_data = {
    name: Faker::Name.first_name,
    category: random_pet_category.sample,
    birthday: Faker::Date.between(from: 8.years.ago, to: Date.today),
    description: Faker::ChuckNorris.fact,
    breed: random_pet_breed.sample
  }
  pet = Pet.new(pet_data)
  random_seller = seller_data.sample
  pet.seller = random_seller
  pet.save!

end
puts "seed completed"
