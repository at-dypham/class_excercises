class MatchesController < ApplicationController
  def schedule
    @tournament = Tournament.find params[:id]
    @matches = Match.where(tournament_id: params[:id], kind: 0)
    @matches_playoff = Match.where(tournament_id: params[:id], kind: 1)
  end
end
