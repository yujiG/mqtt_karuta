class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.references :karuta, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
