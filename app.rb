require "sinatra/activerecord"
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before  do 
	@barbers = Barber.all
end

get '/' do
		erb :index
end

get '/visit' do 
	erb :visit
end

post '/visit' do
	@username = params[:user_name]
	@phone = params[:phone_number]
	@datetime = params[:date_time]
   	@barber = params[:hairdresser]
	@color = params[:color]

	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.color = @color
	c.save

	erb "<h2>Спасибо, вы записались</h2>"

end