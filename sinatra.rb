require "sinatra"
require "pry"

# get '/hello/:name' do
#   "Hello #{params['name']}!"
# end

# Tilt.register Tilt::ERBTemplate, 'html.erb'

get '/hello' do #string tren url
  erb :hello #file hello.erb trong folder views
end

post '/say_something' do
  #binding.pry
  @name = params[:name]
  @say_something = params[:say_something]
  #Write file
  File.open("info.txt", 'w') { |file| file.write(@name + ", " + @say_something) }
  
  #Read file
  fileObj = File.open("info.txt", "r")
  @message = fileObj.gets
  # while (line = fileObj.gets)
  #   @message = line
  # end
  fileObj.close
  erb :hello
end
