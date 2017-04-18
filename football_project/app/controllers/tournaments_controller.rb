class TournamentsController < ApplicationController
  before_action :get_tournaments, only: :index
  before_action :get_tournament, only: [:update, :destroy]

  def index
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new tournament_params
    if @tournament.save
      flash[:success] = "Thêm thành công"
      redirect_to :back
    else
      get_tournaments()
      render 'index'
    end
  end

  def update
    if @tournament.update(tournament_params)
      flash[:success] = "Sửa thành công"
      redirect_to "/tournaments"
    else
      get_tournaments()
      render 'index'
    end
  end

  def destroy
    if @tournament.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
    redirect_to :back
  end

  def show
    get_tournament()
    @tournament_team = TournamentTeam.new
    @group = Group.new
    @groups = Group.where tournament_id: params[:id]
    @teams = Team.where.not id: (TournamentTeam.select("team_id").where  group_id: (Group.select("id").where tournament_id: params[:id]))
  end

  private
  def tournament_params
    params.require(:tournament).permit :name
  end

  def get_tournaments
    @tournaments = Tournament.all
  end

  def get_tournament
    @tournament = Tournament.find params[:id]
  end

end
