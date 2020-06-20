class Game < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :points, through: :users
  belongs_to :karura, optional: true
end
