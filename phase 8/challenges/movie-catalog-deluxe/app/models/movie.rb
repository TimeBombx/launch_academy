class Movie
  attr_reader :id, :title, :year, :rating, :genre, :studio

  def initialize(data, genre, studio)
    @id = data['id']
    @title = data['title']
    @year = data['year']
    @rating = data['rating']
    @genre = genre.ntuples > 0 ? genre.getvalue(0, 0) : "No genre"
    @studio = studio.ntuples > 0 ? studio.getvalue(0, 0) : "No studio"
  end
end