class Track
  attr_reader :album_id, :id, :title, :track_number, :duration_ms

  def initialize( data )
    @album_id = data[:album_id]
    @id = data[:track_id]
    @title = data[:title]
    @track_number = data[:track_number]
    @duration_ms = data[:duration_ms]
  end
end