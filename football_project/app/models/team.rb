class Team < ApplicationRecord
  has_many :tournament_teams, foreign_key: "team_id"
  has_many :groups, through: :tournament_teams
  has_many :tournaments, through: :groups



  validates :name, :presence => {:message => "Vui lòng nhập tên giải đấu!!!" }
  validates :name, :uniqueness => { :message => 'Tên giải đấu đã tồn tại!!!'}
  validates :name, length: { minimum: 2, message: 'tên giải đấu phải có ít nhất 2 ký tự!!!' }

  delegate :id , :name,to: :tournament, prefix: :tournament

  def get_tournaments_name
    tournaments = self.tournaments
    result = ""
    unless tournaments.blank?
      result =  "["
      tournaments.each{ |tournament|
        result +=  '{"id":"' + "#{tournament.id}" + '", "name":"' + "#{tournament.name}" +  '"},'
        if tournament == tournaments.last
          result.chop!
          result += "]"
        end
      }
    end
    return result
  end

  def abc
    return "abc"
  end
end
