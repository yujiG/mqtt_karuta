class Game < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :points, through: :users

  def karuta
    return if karuta_index.blank?
    Karuta.all[karuta_index]
  end
end
