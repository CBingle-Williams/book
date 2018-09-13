require "sinatra"
require "sinatra/reloader" if development? # Reloader doesnt require you to stop and start the server again if you make changes. You just need to reload the webpage
require_relative "./controllers/book_controller.rb"
use Rack::Reloader
use Rack::MethodOverride
run BookController