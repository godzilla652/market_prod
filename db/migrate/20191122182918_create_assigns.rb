class CreateAssigns < ActiveRecord::Migration[5.2]
  def up
    create_table :assigns do |t|
      t.integer :assign_count
      t.references :contract
      t.references :assignable, polymorphic: true

      t.timestamps
    end

    add_column :vehicles, :added, :boolean, default: false
    remove_column :vehicles, :assignable_id
    remove_column :vehicles, :assignable_type
  end

  def down
    drop_table :assigns
    add_column :vehicles, :assignable_id, :bigint
    add_column :vehicles, :assignable_type, :string
    remove_column :vehicles, :added
    add_index :vehicles, [:assignable_id, :assignable_type]
  end
end
