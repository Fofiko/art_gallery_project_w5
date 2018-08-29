require("sinatra")
require("sinatra/contrib/all")
require('pry-byebug')
require_relative("../models/exhibit.rb")
require_relative("../models/artist.rb")
also_reload("../models/*")

#index for visitor
get "/exhibits" do
  @exhibits = Exhibit.all()
  erb (:"exhibits/index")
end

#index for manager
get "/exhibits/manage" do
  @exhibits = Exhibit.all()
  erb (:"exhibits/manage_index")
end

#new for manager
get "/exhibits/manage/new" do
  @artists = Artist.all()
  erb(:"exhibits/new")
end

#filter by category visitor
get "/exhibits/category" do
  @exhibits = Exhibit.find_by_category(params[:category])
  erb(:"exhibits/filter")
end

#filter by category manager
get "/exhibits/manage/category" do
  @exhibits = Exhibit.find_by_category(params[:category])
  erb(:"exhibits/filter")
end

#show for visitor
get "/exhibits/:id" do
  @exhibit = Exhibit.find(params["id"].to_i)
  erb(:"exhibits/show")
end

#show for manager
get "/exhibits/manage/:id" do
  @exhibit = Exhibit.find(params["id"].to_i)
  erb(:"exhibits/manage_show")
end

#create
post "/exhibits" do
  @exhibit = Exhibit.new(params)
  @exhibit.save
  redirect to "/exhibits"
end

#edit for manager
get "/exhibits/manage/:id/edit" do
  @artists = Artist.all()
  @exhibit = Exhibit.find(params[:id])
  erb(:"exhibits/edit")
end

#update
post "/exhibits/manage/:id" do
  exhibit = Exhibit.new(params)
  exhibit.update
  redirect to "/exhibits/manage/#{exhibit.id}"
end

#delete
post "/exhibits/manage/:id/delete" do
  exhibit = Exhibit.find(params[:id])
  exhibit.delete()
  erb(:"exhibits/delete")
end
