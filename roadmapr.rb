require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

map_data = ["foo", "bar"]

get '/' do 
	erb :index, :locals => {:title => "Roadmapr"}
end

get '/map' do
	erb :index, :map => {:title => "Map", :map_data => map_data}
end

post '/new-step' do
	new_step = Hash.new 
	params.each do |key, value|
		new_step[key] = value
		end		
	map_data << new_step
	erb :index, :map => {:title => "Map" :map_data => map_data}
end