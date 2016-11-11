require 'sinatra'
require 'pry'
require 'yaml'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/articles'
end

get '/articles' do
  # @articles = Array.new
  @articles = YAML::load_stream(open("articles.yml"))
  erb :articles
end

get '/article/new' do
  erb :new_article
end

post '/article/new' do
  article_title = params['article_title']
  article_url = params['article_url']
  article_desc = params['article_desc']

  article_hash = Hash.new
  article_hash[:article] = {
    title: article_title,
    url: article_url,
    desc: article_desc
  }

  File.open('articles.yml', 'a') do |file|
    file.write(article_hash.to_yaml)
  end

  redirect '/articles'
end
