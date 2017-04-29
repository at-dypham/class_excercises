class TournamentTeam < ApplicationRecord
  belongs_to :team
  belongs_to :group
  has_many :matches_A, class_name: Match.name, foreign_key: :team_A_id
  has_many :matches_B, class_name: Match.name, foreign_key: :team_B_id

  delegate :id , :name,to: :team, prefix: :team
  delegate :id , :name,to: :group, prefix: :group

  scope :first_teams, -> () {
    where ("pts = #{self.maximum(:pts)} and gd = #{self.maximum(:gd)}")
  }
  scope :second_teams, -> () {
    second_team = self.order(pts: :desc, gd: :desc).limit(2).last
    where ("pts = #{second_team.pts} and gd = #{second_team.gd}")
  }

  def add_team_draw(gf, ga)
    self.update(d: (self.d + 1), gf: (self.gf + gf), ga: (self.ga + ga), pts: (self.pts + 1))
  end

  def add_team_win(gf, ga)
    self.update(w: (self.w + 1), gf: (self.gf + gf), ga: (self.ga + ga), gd: (self.gd + gf - ga), pts: (self.pts + 3))
  end

  def add_team_lose(gf, ga)
    self.update(l: (self.l + 1), gf: (self.gf + gf), ga: (self.ga + ga), gd: (self.gd + gf - ga))
  end

  def reset_team_draw(gf, ga)
    self.update(d: (self.d - 1), gf: (self.gf - gf), ga: (self.ga - ga), pts: (self.pts - 1))
  end

  def reset_team_win(gf, ga)
    self.update(w: (self.w - 1), gf: (self.gf - gf), ga: (self.ga - ga), gd: (self.gd - (gf - ga)), pts: (self.pts - 3))
  end
  
  def reset_team_lose(gf, ga)
    self.update(l: (self.l - 1), gf: (self.gf - gf), ga: (self.ga - ga), gd: (self.gd - (gf - ga)))
  end

  def self.set_rank tournament_teams, rank
    tournament_teams.each do |team|
      team.update rank_in_group: rank
    end
  end

  def get_matches
    binding.pry
    
  end

  def get_quarterfinals_matches
    return Match.where('("matches"."team_A_id" = ? or "matches"."team_B_id" = ?) and kind = 1', self.id, self.id).limit(2)
  end
end
