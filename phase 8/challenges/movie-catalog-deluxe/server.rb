require "sinatra"
require "pg"
require "pry"

require_relative "app/models/movie"
require_relative "app/models/actor"
require_relative "app/models/cast"

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app/views")

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

def select_query(from, what, where = {}, params = [], other = "")
  db_connection do |conn|
    build_where = where.map{|k,v| "#{k}=#{v}"}.join('&&')
    sql = "SELECT #{what.join(", ")} FROM #{from} #{ "WHERE " + build_where if where.length > 0 } #{other}"
    return conn.exec(sql) if params.count <= 0
    return conn.exec_params(sql, params) if params.count > 0
  end
end

get '/' do
  erb :index
end

get '/movies' do
  query = select_query('movies', ['*'], {}, [], 'ORDER BY title ASC LIMIT 25')

  @movies = Array.new
  query.ntuples.times do |i|
    genre = select_query('genres', ['name'], {id:'$1'}, [query[i]['genre_id']])
    studio = select_query('studios', ['name'], {id:'$1'}, [query[i]['studio_id']])
    @movies << Movie.new(query[i], genre, studio)
  end

  erb :'movies/index'
end

get '/movies/:id' do
  query = select_query('movies', ['*'], { id: '$1' }, [params['id']])
  genre = select_query('genres', ['name'], { id: '$1' }, [query[0]['genre_id']])
  studio = select_query('studios', ['name'], { id: '$1' }, [query[0]['studio_id']])
  @movie = Movie.new(query[0], genre, studio)

  cast_query = select_query('cast_members', ['actor_id', "character"], {movie_id:'$1'}, [@movie.id])

  @actors = Array.new
  cast_query.ntuples.times do |i|
    actor_query = select_query('actors', ['*'], { id: '$1' }, [cast_query[i]['actor_id']])
    actor_query.ntuples.times do |j|
      data = actor_query[j]
      data['character'] = cast_query[i]['character']
      @actors << Actor.new(data)
    end
  end

  erb :'movies/show'
end

get '/actors' do
  query = select_query('actors', ['*'], {}, [], 'ORDER BY name ASC LIMIT 25')

  @actors = Array.new
  query.ntuples.times do |i|
    @actors << Actor.new(query[i])
  end

  erb :'actors/index'
end

get '/actors/:id' do
  query = select_query('actors', ['*'], {id:'$1'}, [params['id']])

  @actor = Actor.new(query[0])
  @movies_with_character = Array.new

  cast_query = select_query('cast_members', ['movie_id', 'character'], {actor_id:'$1'}, [@actor.id])
  cast_query.ntuples.times do |i|
    movie_query = select_query('movies', ['*'], { id: '$1' }, [cast_query[i]['movie_id']])
    movie_query.ntuples.times do |j|
      data = Hash.new   
      genre = select_query('genres', ['name'], {id:'$1'}, [movie_query[j]['genre_id']])
      studio = select_query('studios', ['name'], {id:'$1'}, [movie_query[j]['studio_id']])
      data['movie'] = Movie.new(movie_query[j], genre, studio)
      data['character'] = cast_query[i]['character']
      @movies_with_character << Cast.new(data)
    end
  end

  erb :'actors/show'
end