class TeamsController < ApplicationController

  before_action :get_teams, only: :index
  before_action :get_team, only: [:update, :destroy]

  def index
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if @team.save
      flash[:success] = "Thêm thành công"
      redirect_to :back
    else
      get_teams()
      render 'index'
    end
  end

  def update
    if @team.update_attributes(team_params)
      flash[:success] = "Sửa thành công"
      redirect_to "/teams"
    else
      get_teams()
      render 'index'
    end
  end

  def destroy
    if @team.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
    redirect_to :back
  end

  private
  def team_params
    params.require(:team).permit :name
  end

  def get_teams
    @teams = Team.all
  end

  def get_team
    @team = Team.find params[:id]
  end

end
