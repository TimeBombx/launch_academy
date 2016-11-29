class Cast
  attr_reader :movie, :character

  def initialize(data)
    @movie = data['movie']
    @character = data['character']
  end
end