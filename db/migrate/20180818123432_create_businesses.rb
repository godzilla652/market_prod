class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :type_one
      t.date :date_corporation
      t.string :name
      t.string :number_employees
      t.boolean :union_affiliated
      t.string :union_text
      t.references :addressc, foreign_key: true
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
