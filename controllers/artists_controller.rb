require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/artist.rb")
also_reload("../models/*")


#index for visitor
get '/artists' do
  @artists = Artist.all()
  erb (:"artists/index")
end

#index for manager
get '/artists/manage' do
  @artists = Artist.all()
  erb :"artists/manage_index", :layout => :manager_layout
end

#new for manager
get '/artists/manage/new' do
  erb :"artists/new", :layout => :manager_layout
end

#show for visitor
get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artists/show")
end

#show for manager
get '/artists/manage/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb :"artists/manage_show", :layout => :manager_layout
end

#create
post '/artists/manage' do
  @artist = Artist.new(params)
  @artist.save
  redirect to '/artists/manage'
end

#edit for manager
get '/artists/manage/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit", :layout => :manager_layout
end

#update
post '/artists/manage/:id' do
  Artist.new(params).update
  redirect to '/artists/manage'
end

#delete
# if the gallery has exhibits by an artist, that artist cannot be deleted - redirect to their exhibits page
# if there are no exhibits by this artist, allow to delete artist - redirect to artists page after deletion
post '/artists/manage/:id/delete' do
  artist = Artist.find(params[:id])
  if artist.exhibits.length == 0
  artist.delete()
  erb :"artists/delete", :layout => :manager_layout
  else redirect to '/artists/manage'
  end
end
