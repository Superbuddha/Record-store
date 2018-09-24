class Album

  attr_accessor :title, :genre
  attr_reader :id

  def initialize (options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i
  end
end
