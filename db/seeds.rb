require_relative("../models/artist.rb")
require_relative("../models/exhibit.rb")
require("pry-byebug")

Artist.delete_all()
Exhibit.delete_all()

artist1 = Artist.new({
  "name" => "artist1"
  })

artist2 = Artist.new({
  "name" => "artist2"
  })

artist1.save()
artist2.save()


exhibit1 = Exhibit.new({
  "title" => "exhibit1",
  "category" => "cat",
  "artist_id" => artist1.id
  })

exhibit2 = Exhibit.new({
  "title" => "exhibit2",
  "category" => "cat",
  "artist_id" => artist2.id
  })

exhibit1.save()
exhibit2.save()


binding.pry
nil
