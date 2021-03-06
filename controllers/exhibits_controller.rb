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
  erb :"exhibits/manage_index", :layout => :manager_layout

end

#new for manager
get "/exhibits/manage/new" do
  @artists = Artist.all()
  erb :"exhibits/new", :layout => :manager_layout
end

#filter by category visitor
get "/exhibits/category" do
  @exhibits = Exhibit.find_by_category(params[:category])
  erb(:"exhibits/filter")
end

#filter by category manager
get "/exhibits/manage/category" do
  @exhibits = Exhibit.find_by_category(params[:category])
  erb :"exhibits/filter", :layout => :manager_layout
end

#show for visitor
get "/exhibits/:id" do
  @exhibit = Exhibit.find(params["id"].to_i)
  erb(:"exhibits/show")
end

#show for manager
get "/exhibits/manage/:id" do
  @exhibit = Exhibit.find(params["id"].to_i)
  erb :"exhibits/manage_show", :layout => :manager_layout
end

#create
post "/exhibits/manage" do
  @exhibit = Exhibit.new(params)
  @exhibit.save
  redirect to "/exhibits/manage"
end

#edit for manager
get "/exhibits/manage/:id/edit" do
  @artists = Artist.all()
  @exhibit = Exhibit.find(params[:id])
  erb :"exhibits/edit", :layout => :manager_layout
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
  erb :"exhibits/delete", :layout => :manager_layout
end
