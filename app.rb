require 'sinatra'
require 'sinatra/reloader'

require 'sinatra/activerecord'
require 'active_record'
require 'sqlite3'


set :database, {adapter: "sqlite3", database: "barbershophq.sqlite3"}

class Client < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true, numericality: true
  validates :datestamp, presence: true
  validates :barber, presence: true
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :comment, presence: true
end


before do
  @barbers = Barber.all
end

get '/' do

	

  erb :index
end

get '/visit' do
	@c = Client.new

	erb :visit
end

get '/info' do
  erb :information
end



post '/visit' do
  @c = Client.new params[:client]
  @c.save

  if @c.save
    erb "<p>Thank you!</p>"
  else
    @error = @c.errors.full_messages.first
    erb :visit
  end
end

get '/clients' do
  @clients = Client.order('created_at DESC')

  erb :clients
end

get '/clients/:id' do
  @client = Client.find(params[:id])

  erb :client
end

get '/barber/:id' do
  @barber = Barber.find(params[:id])

  erb :barber
end


get '/contacts' do
  @c = Contact.new

  erb :contacts
end

post '/contacts' do
  @c = Contact.new params[:contact]
  @c.save

  if @c.save
    erb "<p>Ваше сообщение отправлено!</p>"
  else
    @error = @c.errors.full_messages.first
    erb :contacts
  end

end
