require "sinatra"
require "pg"
require "pry"

require_relative "models/item"

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development do
  set :db_config, { dbname: "grocery_list_development" }
end

configure :test do
  set :db_config, { dbname: "grocery_list_test" }
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
  build_where = where.map{|k,v| "#{k}=#{v}"}.join('&&')
  sql = "SELECT #{what.join(", ")} FROM #{from} #{ "WHERE " + build_where if where.length > 0 } #{other}"
  db_connection { |conn| conn.exec_params(sql, params) }
end

def insert_query(where, fields, params = [])
  values = Array.new
  params.count.times { |i| values << "$#{i+1}" }
  sql = %Q( INSERT INTO #{where} (#{ fields.join(", ") }) VALUES(#{ values.join(", ") }) )
  db_connection { |conn| conn.exec_params(sql, params) }
end

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  @groceries = Array.new
  query = select_query('groceries', ['*'], {})
  query.ntuples.times { |i| @groceries << Item.new(query[i]) }
  erb :groceries
end

get "/groceries/:id" do
  sql = %Q(SELECT comments.body
    FROM groceries JOIN comments ON comments.grocery_id = groceries.id
    WHERE groceries.id = $1)

  query = db_connection { |conn| conn.exec_params(sql, [params['id']]) }
  g_query = select_query('groceries', ['*'], {id:'$1'}, [params['id']])
  @grocery = Item.new(g_query[0])
  @comments = query.ntuples <= 0 ? Array.new(1, 'No comments') : Array.new

  query.ntuples.times { |i| @comments << query[i]['body'] }

  erb :grocery
end

get "/groceries/:id/edit" do
  query = select_query('groceries', ['*'], {id:'$1'}, [params['id']])
  @grocery = Item.new(query[0])
  erb :edit
end

patch "/groceries/:id" do
  params['name'].strip!
  if !params['name'].empty?
    sql = %Q( UPDATE groceries SET name=$1 WHERE id=$2)
    db_connection { |conn| conn.exec_params(sql, [params['name'], params['id']]) }

    redirect "/groceries"
  else
    redirect "/groceries/#{params['id']}/edit"
  end

end

delete "/groceries/:id" do
  sql = %Q( DELETE FROM groceries WHERE id=$1)
  db_connection { |conn| conn.exec_params(sql, [params['id']]) }
  redirect "/groceries"
end

post "/groceries" do
  params['name'].strip!
  if !params['name'].empty?
    insert_query('groceries', ['name'], [params['name']])
  end
  redirect "/groceries"
end

post "/groceries/:id" do
  params['comment'].strip!
  if !params['comment'].empty?
    insert_query('comments', ['body', 'grocery_id'], [params['comment'], params['id']])
  end
  redirect "/groceries/#{params['id']}"
end
