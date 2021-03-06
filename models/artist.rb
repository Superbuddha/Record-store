require_relative('../db/sql_runner.rb')

class Artist

  attr_accessor :name, :origin
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @origin = options['origin']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists (name, origin) VALUES ($1, $2) RETURNING id"
    values = [@name, @origin]
    artist = SqlRunner.run(sql, values)
    @id = artist[0]['id'].to_i
  end

  def update()
    sql = "UPDATE artists (name, origin) = ($1, $2) WHERE id = $3"
    values = [@name, @origin]
    artist = SqlRunner.run(sql,values)
    @id = artist['id'].to_i
  end

  def delete()
    sql = "DELETE * FROM artists WHERE ID = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist_data = SqlRunner.run(sql)
    artists = map_items(artist_data)
    return artists
  end

  def self.map_items(artist_data)
    return artist_data.map { |artist| Artist.new(artist)}
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    album_data =  SqlRunner.run(sql, values)
    album = map_items(album_data)
  end
  
end
