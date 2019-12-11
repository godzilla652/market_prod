class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.string :name
      t.string :range
      t.references :financial, foreign_key: true

      t.timestamps
    end
  end
end
