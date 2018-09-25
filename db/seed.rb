require('pry-byewbug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Courtney Barnett", "origin" =>"Australia"})
artist1.save()

artist2 = Artist.new({"name" => "Grant Green", "origin" =>"USA"})
artist2.save()

artist3 = Artist.new({"name" => "Nina Simone", "origin" => "USA"})
artist3.save()

artist4 = Artist.new({"name" => "Air", "origin" => "France"})
artist4.save()

artist5 = Artist.new({"name" => "Low", "origin" => "USA"})
artist5.save()

artist6 = Artist.new({"name" => "Films of Colours", "origin" => "England"})
artist6.save()

artist7 = Artist.new({"name" => "Sly & Robbie", "origin" =>"Jamaica"})
artist7.save()

album1 = Album.new({})
