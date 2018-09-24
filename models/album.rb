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
end
