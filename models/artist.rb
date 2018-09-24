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
end
