require 'sinatra'
require 'sinatra/activerecord'
require './models/music'
require "better_errors"
require 'pry'

  configure :development do
     use BetterErrors::Middleware
     BetterErrors.application_root = __dir__
  end

# ------------------- GET ROUTES --------------------
get '/' do 
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all
  
  erb :index
end

get '/artists/new' do
  erb :add
end

get '/artists/:id' do
  @artist = Artist.find_by(id: params[:id].to_i)
  
  erb :show
end

get '/artists/:id/edit' do
  
  @artist = Artist.find_by(id: params[:id].to_i)
  
  erb :edit
end


# ------------- POST/ PUT/ DELETE ROUTES -------------
post '/artists' do
  Artist.create params
  redirect '/artists'
end

put '/artists/:id' do
  artist = Artist.find_by(id: params[:id])
  artist.update(name: params[:name])
  redirect '/artists'
end

delete '/artists/:id' do
  artist = Artist.find_by(id: params[:id])
  artist.destroy
  redirect '/artists'
end







