class CreateLineDvs < ActiveRecord::Migration[5.2]
  def change
    create_table :line_dvs do |t|
      t.string :name
      t.string :type_line
      t.references :display_view, foreign_key: true
      t.references :line_dv, foreign_key: true
      t.boolean :calc

      t.timestamps
    end
  end
end
