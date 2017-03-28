require 'sinatra'
require 'pry'

get "/" do
	erb :home
end

get "" do

end

post "/submit" do 

File.open('test.txt', 'w') do |f2|  	
# File.open("text.txt", "w") { |file| file.write(params[:lastname]) }
	f2.puts " #{params[:firstname]} #{params[:lastname]}" 	
end
	erb :home
end