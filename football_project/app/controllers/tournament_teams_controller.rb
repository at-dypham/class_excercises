class TournamentTeamsController < ApplicationController
  before_action :get_tournament

  def ranking
    binding.pry
  end

  def add
    teams = params[:tournament_team]
    teams["id"].each do |id|
      unless id.blank?
        tournament_team = TournamentTeam.new team_id: id, group_id: @group.id
        tournament_team.save ? flash[:success] = "Thêm thành công" : flash[:danger] = "Thêm thất bại"
      end
    end
    @group.add_matches
    redirect_to :back
  end

  private
  def get_tournament
    @group = Group.find params[:id]
  end
end
