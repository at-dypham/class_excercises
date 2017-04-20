class Admin::TeamsController < AdminController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(permit_params)
    if @team.valid?
      flash.now[:success] = "Updated"
    else
      flash.now[:danger] = "Error"
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def permit_params
    params.require(:team).permit(:name, :description)
  end
end