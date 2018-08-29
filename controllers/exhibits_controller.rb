require("sinatra")
require("sinatra/contrib/all")
require('pry-byebug')
require_relative("../models/exhibit.rb")
require_relative("../models/artist.rb")
also_reload("../models/*")

#index
get "/exhibits" do
  @exhibits = Exhibit.all()
  erb (:"exhibits/index")
end

#new
get "/exhibits/new" do
  @artists = Artist.all()
  erb(:"exhibits/new")
end

#filter by category
get "/exhibits/category" do
  @exhibits = Exhibit.find_by_category(params[:category])
  erb(:"exhibits/index")
end

#show
get "/exhibits/:id" do
  @exhibit = Exhibit.find(params["id"].to_i)
  erb(:"exhibits/show")
end

#create
post "/exhibits" do
  @exhibit = Exhibit.new(params)
  @exhibit.save
  redirect to "/exhibits"
end

#edit
get "/exhibits/:id/edit" do
  @artists = Artist.all()
  @exhibit = Exhibit.find(params[:id])
  erb(:"exhibits/edit")
end

#update
post "/exhibits/:id" do
  exhibit = Exhibit.new(params)
  exhibit.update
  redirect to "/exhibits/#{exhibit.id}"
end

#delete
post "/exhibits/:id/delete" do
  exhibit = Exhibit.find(params[:id])
  exhibit.delete()
  redirect to "/exhibits"
end
