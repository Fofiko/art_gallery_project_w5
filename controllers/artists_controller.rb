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
# if the gallery has exhibits by an artist, that artist cannot be deleted - redirect to their exhibits page
# if there are no exhibits by this artist, allow to delete artist - redirect to artists page after deletion
post '/artists/:id/delete' do
  artist = Artist.find(params[:id])
  if artist.exhibits.length == 0
  artist.delete()
  erb(:"artists/delete")
  else redirect to '/artists'
  end
end
