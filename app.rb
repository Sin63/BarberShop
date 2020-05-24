require "sinatra/activerecord"
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end


get '/' do
	@barbers = Barber.order "created_at DESC"
	erb :index
end