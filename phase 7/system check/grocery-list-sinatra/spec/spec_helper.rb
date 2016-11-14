ENV["RACK_ENV"] ||= "test"
require "rspec"
require "capybara/rspec"
require "csv"

require_relative '../server.rb'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    CSV.open('grocery_list.csv', 'w') { |file| file.puts(["name"]) }
  end

  config.after(:each) do
    CSV.open('grocery_list.csv', 'w') { |file| }
  end
end
