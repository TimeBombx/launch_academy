class Album
  attr_reader :id, :name, :artists
  attr_accessor :tracks

  def initialize( id, name, artists )
    @id = id
    @name = name
    @artists = artists
    @tracks = Array.new
  end

  def summary
    [
      "Name: #{ name }",
      "Artist(s): #{ artists }",
      "Duration (min.): #{ duration_min }",
      "Tracks: ",
      "#{ display_tracks }"
    ].join("\n")
  end

  private
    def display_tracks
      list = ""
      tracks.each do |track|
        list += "- #{ track.title } \n"
      end
      list
    end

    def duration_min
      duration = 0.0
      tracks.each do |track|
        duration += track.duration_ms.to_f
      end
      '%.2f' % (duration / 60_000)
    end
end
