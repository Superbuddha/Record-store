require_relative('../db/sql_runner.rb')
class Album

  attr_accessor :title, :genre
  attr_reader :id

  def initialize (options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title, genre) VALUES($1,$2)RETURNING id"
    values = [@title, @genre]
    album = SqlRunner.run(sql, values)
    @id = album['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, genre) = ($1, $2) WHERE id = $3"
    values = [@title, @genre]
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
end
