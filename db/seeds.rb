require "open-uri"

Pet.destroy_all
User.destroy_all

user_pics = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLDk_pGSeCU1lVzSpFsq2KZrFFgtBnVIUZ5i9HGLI1tx3h85nGsF7tTiEg1vf1Ygf3SPs&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROt7YUKa7excpJt4CR59ZwHzhWDfV1mr0eQ&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYH_VDaGfxQ_cPhkgDPyoxXJgnnKHzEw7kdg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST7TiVjnL2ao3BUold9yvBjJODzTJfOyar7w&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC8kiSH5ZSAcVoj3tAQQDoP_ux0sSricMyUg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEfuXC-ToT_s9eNQ7uyDihU19WD-oJ9W20A&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI6wgX3GXOmzqEQY49Kbc-UkeDkI5HwW2chw&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl6olRtD4wNmjF1K-eCgdUdE0x0cRIKUL5-w&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu10KZdnx4WAc2B3k1tt_m_HbnnhqzCOhrUA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4m5APM4w-uVWMPR9nKN2pM6bTjUqoNP8wPQ&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcX3ZmuppOa1KhiPaTIAZTMjt2UpiYA9QFPEUHiIJoZ5b6yCa2r_F29nNAyiKUQxJAUwo&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-3EhTFKxDhS_dch3tfVTyWWiQdWeWmUCVQ&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROGoqApAB56HbWYk24nXCx2q1uKZ3FkHULuA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwCOd4IfWspXRXmtkzJox9mk_vnYwYrD8Emg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcmG5F-EgBcEy6edWK0KjpOR2Lx2OkzkZR-kHjYWuq8g3FEH4J4c6IvTdIo4-VUc10mSE&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR35qan4uSCGYHR4SPq3sEuGcLCwFSaKowjMA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQRermfSqWhyTuegHdaKDnQpxZWbFnhMFahA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR1pJog_G22VXN0T2JbehGd04hklrFBIImCg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpFreAtrOzdfbsrEHLCtHyBDY4x80z6RBeVA&usqp=CAU"]

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

  file = URI.open(user_pics.shuffle!.pop)
  user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  user.save

  seller_data << user
  puts user.email
end

random_pet_category = %w[dog cat fish bird rodent amphibian reptile others]
random_pet_breed = ["cur", "gatinho miado", "cachorro de rua", "jacaré do papo amarelo", "nemo","pernalonga"]

pet_pics = ["https://www.itl.cat/pngfile/big/325-3250249_1584-golden-retriever-dog-puppy-wallpaper-beautiful-golden.jpg",
            "https://th.bing.com/th/id/R.786653caa036289ba5978f8a2838bddb?rik=Jace9ATfPow9Cg&riu=http%3a%2f%2fimages6.fanpop.com%2fimage%2fphotos%2f39300000%2fDog-dogs-39323649-1440-900.jpg&ehk=2j5hJZOGQYQL6IK9FydtWO%2fMjeCvMXSLLgWS2j9jERE%3d&risl=&pid=ImgRaw&r=0",
            "https://th.bing.com/th/id/R.bb60507b5a1f567e6b6592f375bf5e8d?rik=FgkA6Taf%2fHwJsA&pid=ImgRaw&r=0",
            "https://mega.ibxk.com.br/2016/04/18/18163507399333.jpg?ims=610x",
            "https://th.bing.com/th/id/OIP.EgZWvFvui7L9Qutlcp7F1QHaHa?pid=ImgDet&rs=1",
            "https://i.pinimg.com/736x/23/8d/c2/238dc212be49c077225df89bec45a0f9--ugly-dogs-world-ugliest-dog.jpg",
            "https://th.bing.com/th/id/R.ed75e5ad8309a1f10ce3ba3d31def88c?rik=Bd78WEU0taO3GQ&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2fd%2f7%2f4%2f1060235-cute-kitten-pictures-wallpaper-2880x1800-for-iphone-6.jpg&ehk=SoGim30zH6tKG5p6DjsvOA73%2f5GJFCLr6rKcu0Sif9M%3d&risl=&pid=ImgRaw&r=0",
            "https://wallpapercave.com/wp/wp2618926.jpg",
            "https://3.bp.blogspot.com/-e9iaysd5X1E/UDJmovqjrYI/AAAAAAAAAaE/lQVAJcSeCtA/s1600/catpicturess+(4).jpg",
            "https://amazinganimalphotos.com/wp-content/uploads/2013/04/cutest-cat-picture-ever.jpg",
            "https://i.pinimg.com/originals/99/11/71/99117198f135cc1871479c7e812f3638.jpg",
            "https://www.iizcat.com/uploads/2017/04/w4onp-uc3.JPG",
            "https://www.sheknows.com/wp-content/uploads/2018/08/Fish_umvsts.jpeg",
            "https://th.bing.com/th/id/R.e0375418f237a538b5797803f92887ec?rik=Ht6wz73yNag7JA&pid=ImgRaw&r=0",
            "https://th.bing.com/th/id/OIP.riFHiA0K5kjIQcrNWGoYZQHaE8?pid=ImgDet&rs=1",
            "https://i.pinimg.com/originals/a5/cb/52/a5cb520d3cae56e0c6d17d304e65f899.jpg",
            "https://a.scdn.gr/images/sku_main_images/036553/36553664/xlarge_20220613120904_clown_loach_chromobotia_macracanthus_5cm.jpeg",
            "https://th.bing.com/th/id/R.31256565e0273e95685061a709fc07d6?rik=RlK86u4bKHY7Lg&pid=ImgRaw&r=0",
            "https://fthmb.tqn.com/IgaUXke_k9JCBGKgDrBbVvpc_L4=/2121x1414/filters:fill(auto,1)/Cockatiels-GettyImages-657556722-59ba93956f53ba00111991da.jpg",
            "https://imagesvc.meredithcorp.io/v3/mm/image?url=https://static.onecms.io/wp-content/uploads/sites/24/2019/07/GettyImages-883150476-1.jpg",
            "https://th.bing.com/th/id/R.c1bbf8ae7a8de6e0cdcf966c4c559457?rik=2rtBjqISsRYH6Q&riu=http%3a%2f%2fjustbirding.com%2fwp-content%2fuploads%2f2019%2f01%2fugly-turkey-bird.jpg&ehk=HsbI8bgIaOfLQ30NjY9y4LncuZSnfoxhHwgV%2fvDGUNk%3d&risl=&pid=ImgRaw&r=0",
            "https://i.pinimg.com/originals/da/e3/cb/dae3cb0f55934979a5d8c8248ba5898a.jpg",
            "https://pixnio.com/free-images/2018/06/14/2018-06-14-21-51-25.jpg",
            "https://squeaksandnibbles.com/wp-content/uploads/2018/05/best-rodent-pet-syrian-hamster.jpg",
            "https://squeaksandnibbles.com/wp-content/uploads/2018/05/best-rodent-pet-chipmunk.jpg",
            "https://res.cloudinary.com/jerrick/image/upload/fl_progressive,q_auto,w_1024/tnwpeaixkwxdkfnim0lu.jpg",
            "https://th.bing.com/th/id/R.c697184ba6e6575c72d8d15d8a0886ff?rik=NHwdhJET%2bDz33Q&pid=ImgRaw&r=0",
            "https://images.immediate.co.uk/production/volatile/sites/4/2020/03/GettyImages-1058304880-c-0b54061-scaled.jpg",
            "https://th.bing.com/th/id/R.e22d75dc86053ab192b9200c71550c37?rik=nPZERKw%2bteLHdQ&riu=http%3a%2f%2fcdn0.wideopenpets.com%2fwp-content%2fuploads%2f2016%2f03%2fAdobeStock_5960370.jpeg&ehk=mxDou7UP6PJwV83N0cmCIJXIc01wZ7P4uqjRS5iCVBE%3d&risl=&pid=ImgRaw&r=0",
            "https://etcpets.com/wp-content/uploads/2020/07/tomato-frog-1140x760.png",
            "https://allanspetcenter.com/wp-content/uploads/2021/02/cc_ScienceSource_SS2241050_copy-768x432.jpg",
            "https://i.pinimg.com/736x/30/8c/e9/308ce9c58d3ccef856ab78e040ec7b2a.jpg",
            "https://th.bing.com/th/id/R.6321619206f3fd1321f112387bb8f596?rik=tYR4QkjN4SSawg&riu=http%3a%2f%2fghk.h-cdn.co%2fassets%2f15%2f16%2f980x490%2flandscape-1429037000-pet-lizard-bad-index.jpg&ehk=%2bJVm42Gsbgd3%2fruE9QM4b0aWgmV6oaVctWBCw6FPeOE%3d&risl=&pid=ImgRaw&r=0",
            "https://i.pinimg.com/originals/39/f1/5a/39f15a8f3462978233e47b42934b14d3.jpg",
            "https://petclassifieds.com/wp-content/uploads/2020/04/Best-Pet-Snakes-Ball-Python.jpg",
            "https://th.bing.com/th/id/R.f640cd49a922f92addd40b5771a89319?rik=dxoIDcWqecrujg&riu=http%3a%2f%2freptile.guide%2fwp-content%2fuploads%2f2020%2f02%2fPet-snake.jpg&ehk=n6Q5lcngwbwEkQ2vdok%2bsE6JUbeo1aZ5AkWje1jCJ14%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1",
            "https://i.pinimg.com/originals/e7/b6/13/e7b613ba51a552767582725cb97cda4f.jpg",
            "https://www.infoescola.com/wp-content/uploads/2008/05/capivara-119654188.jpg",
            "https://www.infoescola.com/wp-content/uploads/2010/06/elefante-africano1172570023.jpg",
            "https://media.istockphoto.com/photos/looking-for-a-dentist-picture-id115929208?k=6&m=115929208&s=612x612&w=0&h=2K30_ItfU2Z-v8FNzBReA1YyJK7AGWQQJIgKRl6m2gw=",
            "https://i1.wp.com/www.noticieros.live/noticias/wp-content/uploads/2020/11/ornitonrrico.jpg?resize=1080%2C609&ssl=1"]

20.times do
  pet_data = {
    name: Faker::Name.first_name,
    category: random_pet_category.sample,
    birthday: Faker::Date.between(from: 8.years.ago, to: Date.today),
    description: Faker::ChuckNorris.fact,
    breed: random_pet_breed.sample
  }
  pet = Pet.new(pet_data)
  file = URI.open(pet_pics.shuffle!.pop)
  random_seller = seller_data.sample
  pet.seller = random_seller
  pet.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  pet.save!
end
puts "seed completed"
