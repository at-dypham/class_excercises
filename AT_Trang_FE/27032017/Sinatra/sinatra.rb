require 'sinatra'
require 'pry'

get "/" do
	erb :form
end
post "/show" do
	@name = params[:name]
  @saysomething = params[:saysomething]
	"#{@name} #{@saysomething}"

end