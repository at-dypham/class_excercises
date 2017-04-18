class Match < ApplicationRecord
  belongs_to :tournament, foreign_key: "tournament_id"
  belongs_to :teamA, class_name: TournamentTeam.name, foreign_key: "team_A_id"
  belongs_to :teamB, class_name: TournamentTeam.name, foreign_key: "team_B_id"
  belongs_to :group, foreign_key: "group_id"
  has_many :penalties, foreign_key: "match_id"
  has_one :group, through: :teamA

  delegate :id , :name,to: :group, prefix: :group
end
