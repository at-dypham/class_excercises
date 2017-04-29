class TournamentsController < ApplicationController
  before_action :get_tournaments, only: :index
  before_action :get_tournament, only: [:update, :destroy, :submit, :submit_matches]

  def index
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new tournament_params
    if @tournament.save
      flash.now[:success] = "Thêm thành công"
      redirect_to :back
    else
      get_tournaments()
      render 'index'
    end
  end

  def update
    if @tournament.update(tournament_params)
      flash.now[:success] = "Sửa thành công"
      redirect_to "/tournaments"
    else
      get_tournaments()
      render 'index'
    end
  end

  def destroy
    if @tournament.destroy
      flash.now[:success] = "Xóa thành công"
    else
      flash.now[:danger] = "Xóa thất bại"
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

  def submit
    if @tournament.check_full_teams
      @tournament.destroy_matches
      @tournament.add_matches
      flash[:success] = "Submit thành công"
    else
      flash[:danger] = "Vui lòng chọn đủ số đội, group cho giải đấu!!"
    end
    redirect_to :back    
  end

  def submit_matches
    if @tournament.check_results
      @tournament.set_next_go_team
      if @tournament.check_quarterfinals_groups
        @tournament.add_quarterfinals_matches
        redirect_to quarterfinals_tournament_path @tournament.id
      else
        flash[:danger] = "Vui lòng chọn các đội đi tiếp"
        redirect_to ranking_tournament_path @tournament.id
      end
    else
      flash[:danger] = "Vui lòng chọn cập nhật đầy đủ tỷ số cho giải đấu!!"
      redirect_to :back
    end
  end

  private
  def tournament_params
    params.require(:tournament).permit :name, :num_of_teams
  end

  def get_tournaments
    @tournaments = Tournament.all
  end

  def get_tournament
    @tournament = Tournament.find params[:id]
  end

end
