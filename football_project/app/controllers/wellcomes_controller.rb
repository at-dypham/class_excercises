class WellcomesController < ApplicationController

  def index
    @hello = params[:hello].present? ? params[:hello] : "hello"
  end
end
