# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
#...
Product.create!(title: 'Mobile App',
  description:
    %{<p>
      <em> wow app idea </em>
      this is a mobile app local
      </p>},
      image_url: 'ruby.jpg',
      price: 25.00)
  #...
Product.create!(title: 'Me at this point',
  description:
    %{<p>
       ruby ruby on rails everywhere
      </p>},
      image_url: 'everywhere.png',
      price: 30.00)

Product.create!(title: 'ruby on rails?',
  description:
    %{<p>
      false! and learn why!
    </p>},
    image_url: 'false.jpg',
    price: 20.00)

Product.create!(title: 'Ruby is not a person',
  description:
    %{<p>
      how explain that to anyone who doesn't code
    </p>},
    image_url: 'god.jpg',
    price: 60.00)

Product.create!(title: 'first commit',
  description:
    %{<p>
      this is getting serious
    </p>},
    image_url: 'serious.png',
    price: 29.99)

Product.create!(title: 'Me right now',
  description:
    %{<p>
      woah! a whole new world
    </p>},
    image_url: 'woah.jpg ',
    price: 1999999999999.99)
