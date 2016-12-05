require "sinatra"
require "sinatra/activerecord"
require_relative "models/recipe"
require_relative "models/comment"

set :bind, '0.0.0.0'  # bind to all interfaces