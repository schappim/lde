#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

set :bind, '10.0.1.24'
set :port, 80
enable :sessions

get '/' do 
  'hello world'
end

get '/brightness' do
    @level = 0 
    erb :brightness
end

post '/brightness' do
    session["level"] == params["level"]
    @level = "#{session["level"]}"
    level = params['level'].to_f / 100
    `echo "22=#{level}" > /dev/pi-blaster`
    erb :brightness
end

