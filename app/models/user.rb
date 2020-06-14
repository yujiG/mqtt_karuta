class User < ApplicationRecord
  belongs_to :game
  has_many :points, dependent: :destroy
end
