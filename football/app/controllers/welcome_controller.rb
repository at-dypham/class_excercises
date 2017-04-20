class WelcomeController < ApplicationController

  def index
    @hello = params[:hello].present? ? params[:hello] : "Hello"
  end
end
