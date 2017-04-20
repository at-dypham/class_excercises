class Team < ApplicationRecord

  validates_uniqueness_of :name
end
