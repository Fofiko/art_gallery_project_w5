require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/artist.rb")
also_reload("../models/*")


#index
get '/artists' do
  @artists = Artist.all()
  erb (:"artists/index")
end

#new
get '/artists/new' do
  erb(:"artists/new")
end

#show
get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artists/show")
end

#create
post '/artists' do
  @artist = Artist.new(params)
  @artist.save
  redirect to '/artists'
end

#edit
get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:"artists/edit")
end

#update
post '/artists/:id' do
  Artist.new(params).update
  redirect to '/artists'
end

#delete
post '/artists/:id/delete' do
  artist = Artist.find(params[:id])
  artist.delete()
  redirect to '/artists'
end
