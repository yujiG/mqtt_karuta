class Karuta < ApplicationRecord
  NAMES = %w[い ろ は に ほ へ と ち り ぬ る を わ か よ た れ そ つ ね な ら む う ゐ の お く や ま け ふ こ え て あ さ き ゆ め み し ゑ ひ も せ す]

  class << self
    def seed
      now = Time.current
      karutas = NAMES.map.with_index(1) do |name, i|
        { id: i, name: name, created_at: now, updated_at: now }
      end
      Karuta.upsert_all(karutas)
    end
  end
end
