class Game < ApplicationRecord
  INTERVAL = 1.seconds
  LAST_KARUTA_INDEX = (Karuta.all.size - 1)

  has_many :users, dependent: :destroy
  has_many :points, through: :users

  def update_next_karuta
    next_index = karuta_index.present? ? karuta_index.next : 0
    update!(karuta_index: next_index)
    karuta
  end

  def karuta
    return if karuta_index.blank?
    Karuta.all.shuffle(random: Random.new(id))[karuta_index]
  end

  def last_karuta?
    karuta_index == LAST_KARUTA_INDEX
  end
  
  def finished?
    last_karuta? && !points.exists?(karuta: karuta)
  end
end
