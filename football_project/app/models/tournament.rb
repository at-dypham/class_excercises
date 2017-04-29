class Tournament < ApplicationRecord
  has_many :groups
  has_many :teams, through: :groups
  has_many :matches, foreign_key: :tournament_id
  has_many :tournament_teams, through: :groups

  validates :name, :presence => {:message => "Vui lòng nhập tên giải đấu!!!" }
  validates :name, :uniqueness => { :message => 'Tên giải đấu đã tồn tại!!!'}
  validates :name, length: { minimum: 6, message: 'tên giải đấu phải có ít nhất 6 ký tự!!!' }
  #validates :name, uniqueness: true#, mesage: 'Tên giải đấu đã tồn tại'

  def check_full_teams
    return self.tournament_teams.size < self.num_of_teams ? false : true
  end

  def check_full_groups
    return self.groups.size < (self.num_of_teams / 4) ? false : true
  end

  def check_results
    return (self.matches.where kind: 0, score: nil).size > 0 ? false : true
  end

  def destroy_matches
    self.matches.each do |match|
      match.destroy
    end
  end

  def add_matches
    self.groups.each do |group|
      group.add_matches
    end
  end

  def set_next_go_team
    self.groups.each do |group|
        first_teams = group.tournament_teams.first_teams
      if first_teams.size < 2 #1 đội nhất điểm
        first_teams.first.update rank_in_group: 1
        second_teams = group.tournament_teams.second_teams
        TournamentTeam.set_rank second_teams, 2
      else
        TournamentTeam.set_rank first_teams, 1
      end
    end
  end

  def add_quarterfinals_matches
    groups = self.groups.to_a
    (1..groups.size/2).each do
      sub_groups = groups.slice!(0,2)
      first_group_one = sub_groups.first.get_teams_to_quarterfinal.first
      second_group_two = sub_groups.last.get_teams_to_quarterfinal.last
      Match.create team_A_id: first_group_one.id, team_B_id: second_group_two.id, kind: 1, tournament_id: self.id
      Match.create team_A_id: second_group_two.id, team_B_id: first_group_one.id, kind: 1, tournament_id: self.id
      first_group_two = sub_groups.last.get_teams_to_quarterfinal.first
      second_group_one = sub_groups.first.get_teams_to_quarterfinal.last
      Match.create team_A_id: first_group_two.id, team_B_id: second_group_one.id, kind: 1, tournament_id: self.id
      Match.create team_A_id: second_group_one.id, team_B_id: first_group_two.id, kind: 1, tournament_id: self.id
    end
  end

  def check_quarterfinals_groups
    self.groups.each do |group|
      if ((group.get_teams_with_rank 1).size > 1 || (group.get_teams_with_rank 2).size > 1)
        return false
      end
    end
    return true
  end
end
