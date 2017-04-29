class TournamentTeamsController < ApplicationController
  before_action :get_tournament, only: :add

  def ranking
    @tournament = Tournament.find params[:id]
  end

  def add
    teams = params[:tournament_team]
    teams["id"].each do |id|
      unless id.blank?
        tournament_team = TournamentTeam.new team_id: id, group_id: @group.id
        tournament_team.save ? flash[:success] = "Thêm thành công" : flash[:danger] = "Thêm thất bại"
      end
    end
    redirect_to :back
  end

  def set_rank
    first_teams_ids = params["first_teams"] == nil ? [] : params["first_teams"]
    second_teams_id = params["second_teams"] == nil ? [] : params["second_teams"]
    if (first_teams_ids & second_teams_id).size > 0
      flash[:danger] = "dữ liệu không hợp lệ. Các đội bóng không đưọc trùng nhau!!!"
      redirect_to :back
    else
      @tournament = Tournament.find params[:id]
      @tournament.groups.each do |group|
        group.set_teams_to_quarterfinal first_teams_ids, 1
        group.set_teams_to_quarterfinal second_teams_id, 2
      end
      @tournament.add_quarterfinals_matches
      redirect_to quarterfinals_tournament_path @tournament.id
    end
  end

  private
  def get_tournament
    @group = Group.find params[:id]
  end

end
