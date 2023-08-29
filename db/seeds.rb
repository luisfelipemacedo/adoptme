User.destroy_all
Pet.destroy_all

seller_data = []
20.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  user = User.create!({
    first_name: first,
    last_name: last,
    email: "#{first[0]}_#{last}@example.com".downcase,
    passoword: "123123",
    phone: Faker::PhoneNumber.phone_number
  })
  seller_data << user
end

random_pet_category = ["dog", "cat", "reptile", "bird", "rabbit", "rodent", "amphibian", "fish"]
random_pet_breed = ["cur", "gatinho miado", "cachorro de rua", "jacaré do papo amarelo"]


20.times do
  pet_data = {
    name: Faker::Name.first_name,
    category: random_pet_category.sample,
    date_of_birth: Faker::Date.between(from: 8.years.ago, to: Date.today),
    description: Faker::Name.last_name,
    breed: random_pet_breed.sample
  }
  pet = Pet.new(pet_data)
  random_seller = seller_data.sample
  pet.seller = random_seller
  pet.save!

end
puts "seed completed"
