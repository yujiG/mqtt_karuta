class Point < ApplicationRecord
  belongs_to :user
  belongs_to :karuta

  scope :firstest, ->(user_ids) {
    joins("LEFT OUTER JOIN (
      SELECT id, karuta_id, created_at
      FROM points
      WHERE user_id in (#{user_ids.join(',')})
    ) as p on p.karuta_id = points.karuta_id AND p.created_at < points.created_at".squish)
      .where('p.id IS NULL')
  }
end
