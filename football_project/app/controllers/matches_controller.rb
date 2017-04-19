class MatchesController < ApplicationController

  def schedule
    @tournament = Tournament.find params[:id]
    @matches = Match.where(tournament_id: params[:id], kind: 0)
  end

  def update_score
    @match = Match.new get_match_score
    respond_to do |format|
      format.js
    end
  end

  private
  def get_match_score
    params.require(:match).permit :id, :team_A_id, :team_B_id, :time
  end


end
