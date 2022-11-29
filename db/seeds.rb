# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create( username: "test_user", 
      password: "sup3r-secret", 
      password_confirmation: "sup3r-secret", 
      image_url: "https://via.placeholder.com/150", 
      bio: "bio" )

Recipe.create([
        {
          user_id: user.id,
          title: "Rice", 
          instructions: "Measure 1 cup of rice in bowl of rice cooker. Wash rice. Fill with water to level indicated by manufacturer. Put bowl in rice cooker. Press 'Cook'. Enjoy!",
          minutes_to_complete: 10
        },
        {
          user_id: user.id,
          title: "Burnt Rice", 
          instructions: "Measure 1 cup of rice in bowl of rice cooker. Don't add any water. Put bowl in rice cooker. Press 'Cook'. Enjoy!",
          minutes_to_complete: 10
        }
      ])

     


