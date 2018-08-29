require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/artists_controller")
require_relative("controllers/exhibits_controller")

get "/" do
  erb(:index)
end

get "/manager" do
  erb(:manager_index)
end


get "/visitor" do
  erb(:visitor_index)
end
