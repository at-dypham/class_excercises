require "sinatra"
require 'pry'
  get "/" do
      erb :home
  end

  get "/home/:name/:say" do
      erb :home
  end

  post "/saysomething" do
    name= params[:firstname]
    say =params[:saysomething]
    File.open("text.txt", "w") { |file|
      file.write("#{name} #{say}")
     }
    redirect to("home/#{name}/#{say}")
  end


