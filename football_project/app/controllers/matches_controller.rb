class MatchesController < ApplicationController

  before_action :get_match, only: [:update_score, :update_time,:add_score]
  before_action :get_score, only: [:add_score, :update_score]

  def schedule
    @match = Match.new
    @tournament = Tournament.find params[:id]
  end

  def add_score
    if @match.update score: get_score
      @match.add_score
      flash.now[:success] = "Thêm tỷ số thành công"
    else
      flash.now[:danger] = @match.errors.full_messages
    end
    respond_to do |format|
      format.js
    end
  end

  def update_score
    @old_match = @match.dup
    if @match.update score: get_score
      @match.update_score @old_match
      flash.now[:success] = "Sửa tỷ số thành công"
    else
      flash.now[:danger] = @match.errors.full_messages
    end
    respond_to do |format|
      format.js
    end
  end

  def quarterfinals
    @tournament = Tournament.find params[:id]
    @matches = Match.where tournament_id: @tournament.id, kind: 1
  end

  private
  def get_match_info
    params.require(:match).permit :team_A_score, :team_B_score, :time
  end

  def get_match
    @match = Match.find params[:id]
  end

  def get_score
    score = params[:score]
  end

end
