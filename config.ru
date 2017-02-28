# tell Heroku what to load
require './lib/application.rb'

# tell Heroku what to do
run Sinatra::Application
