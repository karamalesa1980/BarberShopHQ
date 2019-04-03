require 'sinatra'
require 'sinatra/reloader'

require 'sinatra/activerecord'
require 'active_record'
require 'sqlite3'


set :database, {adapter: "sqlite3", database: "barbershophq.sqlite3"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do

	@barbers = Barber.order "created_at DESC"

  erb :index
end


get '/info' do
  erb :information
end