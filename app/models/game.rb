class Game < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :karura, optional: true
end
