class Karuta < ApplicationRecord
  NAMES = %w[い ろ は に ほ へ と ち り ぬ る を わ か よ た れ そ つ ね な ら む う ゐ の お く や ま け ふ こ え て あ さ き ゆ め み し ゑ ひ も せ す]

  class << self
    def seed
      karutas = NAMES.map.with_index(1) do |name, i|
        karuta = Karuta.find_or_initialize_by(id: i)
        karuta.name = name
        karuta
      end
      Karuta.import(karutas)
    end
  end
end
