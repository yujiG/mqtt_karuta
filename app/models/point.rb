class Point < ApplicationRecord
  belongs_to :user
  belongs_to :karuta

  scope :firstest, -> {
    joins('LEFT OUTER JOIN points as p on p.karuta_id = points.karuta_id AND p.created_at < points.created_at')
      .where('p.id IS NULL')
  }
end
