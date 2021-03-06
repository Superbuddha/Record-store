require('pry')
require_relative('../db/sql_runner.rb')
  class Album

    attr_accessor :title, :genre, :stock
    attr_reader :id, :artist_id

    def initialize (options)
      @title = options['title']
      @genre = options['genre']
      @stock = options['stock'].to_i
      @id = options['id'].to_i
      @artist_id = options['id'].to_i
    end

    def save()
      sql = "INSERT INTO albums(title, genre, stock, artist_id) VALUES($1, $2, $3, $4)RETURNING id"
      values = [@title, @genre, @stock, @artist_id]
      album = SqlRunner.run(sql, values)
      @id = album[0]['id'].to_i
    end

    def update()
      sql = "UPDATE albums SET (title, genre, stock, artist_id) = ($1, $2, $3, $4) WHERE id = $5"
      values = [@title, @genre, @stock, @artist_id]
      album = SqlRunner.run(sql, values)
      @id = album['id'].to_i

    end

    def delete()
      sql = "DELETE * FROM album WHERE id = $1"
      values =[@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all
      sql ="DELETE FROM albums"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM albums"
      album_data = SqlRunner.run(sql)
      albums = map_items(album_data)
      return albums
    end

    def self.map_items(album_data)
      return album_data.map {|album| Album.new(album)}
    end

  end
  
