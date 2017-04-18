class TournamentTeam < ApplicationRecord
  belongs_to :team
  belongs_to :group

  delegate :id , :name,to: :team, prefix: :team
end
