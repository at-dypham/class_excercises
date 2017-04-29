class Group < ApplicationRecord
  has_many :tournament_teams, foreign_key: "group_id"
  has_many :teams, through: :tournament_teams
  belongs_to :tournament
  has_many :matches, through: :tournament_teams

  validates :name, :presence => {:message => "Vui lòng nhập tên group!!!" }
  validates :name, length: { minimum: 6, message: 'tên group phải có ít nhất 6 ký tự!!!' }
  validates :name, :uniqueness => { :message => 'Tên group đã tồn tại!!!'}

  scope :current_group, ->(tournament_id){
    where("tournament_id = ?", tournament_id).limit(1)
  }

  delegate :id , :name,to: :tournament, prefix: :tour

  def add_matches
    teams = self.tournament_teams
    for x in 0..2
      for y in ((x+1)..3)
        match_1st_leg = Match.new team_A_id: teams[x].id, team_B_id: teams[y].id, tournament_id: self.tour_id
        match_1st_leg.save
        match_2st_leg = Match.new team_A_id: teams[y].id, team_B_id: teams[x].id, tournament_id: self.tour_id
        match_2st_leg.save
      end
    end    
  end

  def get_teams_with_ids ids
    self.tournament_teams.where(id: ids)
  end

  def get_teams_with_rank rank
    self.tournament_teams.where rank_in_group: rank
  end

  def get_teams_to_quarterfinal
    self.tournament_teams.where(rank_in_group: [1,2]).order(rank_in_group: :asc)
  end

  def set_teams_to_quarterfinal teams_id, rank
    unless teams_id.blank?
      teams_to_quarterfinal = self.get_teams_with_rank rank
      if teams_to_quarterfinal.size > 1
        teams_to_quarterfinal_ids = teams_to_quarterfinal.pluck(:id).map(&:to_s)
        eliminated_teams_ids = teams_to_quarterfinal_ids - teams_id
        eliminated_teams = self.get_teams_with_ids eliminated_teams_ids
        TournamentTeam.set_rank eliminated_teams, 0
      end
    end
  end
end
