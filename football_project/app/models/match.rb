class Match < ApplicationRecord
  belongs_to :tournament, foreign_key: "tournament_id"
  has_many :penalties, foreign_key: "match_id"
  has_one :group, through: :teamA
  has_one :teamA, class_name: TournamentTeam.name, foreign_key: :id, primary_key: :team_A_id
  has_one :teamB, class_name: TournamentTeam.name, foreign_key: :id, primary_key: :team_B_id

  scope :current_match, ->(team_B_id, kind){
    where('("matches"."team_B_id" = ? and "matches"."kind" = ?)', team_B_id, kind).limit(1)
  }

  
  delegate :id , :name,to: :group, prefix: :group
  
  #alias_attribute :abc, :team_A_score

  def add_score
    scores = self.score.split("-")
    team_A_score = scores[0].to_i
    team_B_score = scores[1].to_i
    teamA = TournamentTeam.find self.team_A_id
    teamB = TournamentTeam.find self.team_B_id
    if team_A_score == team_B_score
      teamA.add_team_draw(team_A_score, team_B_score)
      teamB.add_team_draw(team_B_score, team_A_score)
    elsif team_A_score > team_B_score
      teamA.add_team_win(team_A_score, team_B_score)
      teamB.add_team_lose(team_B_score, team_A_score)
    else
      teamA.add_team_lose(team_A_score, team_B_score)
      teamB.add_team_win(team_B_score, team_A_score)
    end
  end

  def update_score old_match
    teamA = TournamentTeam.find self.team_A_id
    teamB = TournamentTeam.find self.team_B_id
    old_scores = old_match.score.split("-")
    old_team_A_score = old_scores[0].to_i
    old_team_B_score = old_scores[1].to_i
    if old_team_A_score == old_team_B_score
      teamA.reset_team_draw(old_team_A_score, old_team_B_score)
      teamB.reset_team_draw(old_team_B_score, old_team_A_score)
      self.add_score
    elsif old_team_A_score > old_team_B_score
      teamA.reset_team_win(old_team_A_score, old_team_B_score)
      teamB.reset_team_lose(old_team_B_score, old_team_A_score)
      self.add_score
    else
      teamA.reset_team_lose(old_team_A_score,old_team_B_score)
      teamB.reset_team_win(old_team_B_score, old_team_A_score)
      self.add_score
    end
  end

end
