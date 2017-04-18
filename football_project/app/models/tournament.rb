class Tournament < ApplicationRecord
  has_many :group
  has_many :teams, through: :groups
  has_many :matches, foreign_key: :tournament_id

  validates :name, :presence => {:message => "Vui lòng nhập tên giải đấu!!!" }
  validates :name, :uniqueness => { :message => 'Tên giải đấu đã tồn tại!!!'}
  validates :name, length: { minimum: 6, message: 'tên giải đấu phải có ít nhất 6 ký tự!!!' }
  #validates :name, uniqueness: true#, mesage: 'Tên giải đấu đã tồn tại'
end
