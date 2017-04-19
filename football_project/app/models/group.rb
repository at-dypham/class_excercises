class Group < ApplicationRecord
  has_many :tournament_teams, foreign_key: "group_id"
  has_many :teams, through: :tournament_teams
  belongs_to :tournament

  validates :name, :presence => {:message => "Vui lòng nhập tên giải đấu!!!" }
  validates :name, length: { minimum: 6, message: 'tên giải đấu phải có ít nhất 6 ký tự!!!' }

  delegate :id , :name,to: :tournament, prefix: :tour

  def add_matches
    teams = self.tournament_teams
    for x in 0..2
      for y in ((x+1)..3)
        match = Match.new team_A_id: teams[x].id, team_B_id: teams[y].id, tournament_id: self.tour_id
        match.save
      end
    end    
  end
end
