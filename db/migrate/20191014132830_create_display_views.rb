class CreateDisplayViews < ActiveRecord::Migration[5.2]
  def change
    create_table :display_views do |t|
      t.string :name
      t.bigint :viewable_id
      t.string :viewable_type

      t.timestamps
    end
    add_index :display_views, [:viewable_id, :viewable_type]
  end
end
