class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :key, null: false
      t.references :karuta, null: true
      t.datetime :start_at, null: true
      t.timestamps
    end
  end
end
