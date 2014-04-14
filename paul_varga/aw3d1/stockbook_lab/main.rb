require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'PG'

require_relative 'models/db_base'

require_relative 'models/portfolio'
require_relative 'models/category'

require_relative 'controllers/portfolios_controller'
require_relative 'controllers/categories_controller'


get '/' do
  erb :home  
end
  



binding.pry