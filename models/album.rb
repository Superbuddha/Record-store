require_relative('../db/sql_runner.rb'
class Album

  attr_accessor :title, :genre, :stock
  attr_reader :id

  def initialize (options)
    @title = options['title']
    @genre = options['genre']
    @stock = options['stock'].to_i
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title, genre, stock) VALUES($1, $2, $3)RETURNING id"
    values = [@title, @genre, @stock]
    album = SqlRunner.run(sql, values)
    @id = album[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, genre, stock) = ($1, $2, $3) WHERE id = $3"
    values = [@title, @genre, @stock]
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

  end
end
