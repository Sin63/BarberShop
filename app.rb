require "sinatra/activerecord"
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }, numericality: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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
	@c = Client.new
	erb :visit
end

post '/visit' do

	@c = Client.new params[:client]
	if @c.save
		erb "<h2>Спасибо, вы записались</h2>"
	else 
		@error = @c.errors.full_messages.first
		erb :visit
	end
end

get '/barber/:id' do
	erb :barber
  end