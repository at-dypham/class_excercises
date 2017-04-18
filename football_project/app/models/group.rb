class Group < ApplicationRecord
  has_many :tournament_teams, foreign_key: "group_id"
  has_many :teams, through: :tournament_teams
  belongs_to :tournament

  validates :name, :presence => {:message => "Vui lòng nhập tên giải đấu!!!" }
  validates :name, length: { minimum: 6, message: 'tên giải đấu phải có ít nhất 6 ký tự!!!' }
end
