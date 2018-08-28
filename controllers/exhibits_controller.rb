require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/exhibit.rb")
require_relative("../models/artist.rb")
also_reload("../models/*")

#index
get '/exhibits' do
  @exhibits = Exhibit.all()
  erb (:"exhibits/index")
end

#new
get '/exhibits/new' do
  @artists = Artist.all()
  erb(:"exhibits/new")
end

#show
get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'].to_i)
  erb(:"exhibits/show")
end

#create
post '/exhibits' do
  @exhibit = Exhibit.new(params)
  @exhibit.save
  redirect to '/exhibits'
end

#edit
get '/exhibits/:id/edit' do
  @artists = Artist.all()
  @exhibit = Exhibit.find(params[:id])
  erb(:"exhibits/edit")
end

#update
post '/exhibits/:id' do
  Exhibit.new(params).update
  redirect to '/exhibits'
end
