class ChangeType < ActiveRecord::Migration[5.2]
  def change
    remove_column :field_estimators, :option
   add_column :field_estimators, :option, :jsonb
  end
end
