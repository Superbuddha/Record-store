require_relative('../db/sql_runner.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize (options)
    @name = options['name']
    @id = options ['id'].to_i

  end
  def save()
    sql = "INSERT INTO artists (name), VALUES ($1) RETURNING id"
    values = [@name]
    artist = SqlRunner.run(sql, values)
    @id = artist['id'].to_i
  end

  def update()
    sql = "UPDATE artists (name) = ($1) WHERE id = $2"
    values = [@name]
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
end
