class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :var, null: false
      t.text :value, null: true
      t.integer :thing_id, null: true
      t.string :thing_type, null: true, limit: 30
      t.timestamps
    end

    add_index :settings, %i[thing_type thing_id var], unique: true
  end
end
