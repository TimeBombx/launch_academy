require 'time'

class Movie
  attr_reader :title, :catergory, :time

  def initialize ( title, catergory, time )
    @title = title
    @catergory = catergory
    @time = Time.parse(time)
  end

  def showing_after? show_time
    (Time.parse(show_time) <=> @time).negative?
  end

  def showing_between? time1, time2
    @time.between?( Time.parse( time1 ), Time.parse( time2 ) )
  end

  def comedy?
    catergory == "Comedy"
  end
end

movies = [
  Movie.new( 'The Princess Bride', 'Comedy', '7:30PM' ),
  Movie.new( 'Troll 2', 'Horror', '7:30PM' ),
  Movie.new( 'Pet Cemetery', 'Horror', '8:15PM' ),
  Movie.new( 'Flight of the Navigator', 'Adventure', '8:17PM' ),
  Movie.new( 'Teen Witch', 'Comedy', '8:20PM' ),
  Movie.new( 'The Goonies', 'Comedy', '8:30PM' ),
  Movie.new( 'Better Off Dead', 'Comedy', '8:45PM' ),
  Movie.new( 'Weekend at Bernies', 'Comedy', '9:00PM' ),
  Movie.new( 'The Wizard', 'Adventure', '9:10PM' ),
]

puts "Does the movie show after 7:00PM?: #{ movies[0].showing_after? "7:00PM" }"
puts "Does the movie show after 7:40PM?: #{ movies[0].showing_after? "7:40PM" }"
puts "Is the movie a comedy? #{ movies[0].comedy? }"
puts "Showing between 6:30PM and 7:30PM?: #{ movies[0].showing_between? "6:30PM", "7:30PM" }"
