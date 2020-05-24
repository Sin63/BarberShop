require "sinatra/activerecord"
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require ''

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end