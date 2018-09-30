require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Courtney Barnett", "origin" =>"Australia"})
artist1.save()

artist2 = Artist.new({"name" => "Grant Green", "origin" =>"USA"})
artist2.save()

artist3 = Artist.new({"name" => "Laura Veirs", "origin" => "USA"})
artist3.save()

artist4 = Artist.new({"name" => "Air", "origin" => "France"})
artist4.save()

artist5 = Artist.new({"name" => "Low", "origin" => "USA"})
artist5.save()

artist6 = Artist.new({"name" => "Biffy Clyro", "origin" => "Scotland"})
artist6.save()

artist7 = Artist.new({"name" => "Sly & Robbie", "origin" =>"Jamaica"})
artist7.save()

album1 = Album.new({
  "title" => "Things We Lost in the Fire",
  "genre" =>"Indie Pop",
  "stock" =>"7",
  "artist_id" => "5"})
album1.save()
#
# album2 = Album.new({
#   "title" => "Pocket Symphony",
#   "genre" =>"Indie Rock",
#   "stock" =>"4",
#   "artist_id" => "4"})
# album2.save()
#
# album3 = Album.new({
#   "title" => "Dubrising",
#   "genre" =>"Reggae",
#   "stock" =>"5",
#   "artist_id" =>"7"})
# album3.save()
#
# album4 = Album.new({
#   "title" => "Sometimes I sit...",
#   "genre" =>"Indie Rock",
#   "stock" =>"3",
#   "artist_id" => "1"})
# album4.save()
#
# album5 = Album.new({
#   "title" => "July Flame",
#   "genre" =>"Songwriter",
#   "stock" =>"7",
#   "artist_id" =>"3"})
# album5.save()
#
# album6 = Album.new({
#   "title" => "Year of Meteors",
#   "genre" =>"Songwriter",
#   "stock" =>"10",
#   "artist_id" =>"3"})
# album6.save()
#
# album7 = Album.new({
#   "title" => "Double Negative",
#   "genre" =>"Indie Pop",
#   "stock" =>"8",
#   "artist_id" => "5"})
# album7.save()
#
# album8 = Album.new({
#   "title" => "Green Street",
#   "genre" =>"Jazz",
#   "stock" =>"5",
#   "artist_id" =>"2"})
# album8.save()
#
# album9 = Album.new({
#   "title" => "Massive",
#   "genre" =>"Reggae",
#   "stock" =>"14",
#   "artist_id" =>"7"})
# album9.save()
#
# album10 = Album.new({
#   "title" => "Balance, Not Symmetry",
#   "genre" => "Rock",
#   "stock" => "12",
#   "artist_id" => "6"
#   })

binding.pry
nil
