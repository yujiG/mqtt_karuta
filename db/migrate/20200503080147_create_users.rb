class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :key, null: false
      t.references :game, null: false
      t.timestamps
    end
  end
end
