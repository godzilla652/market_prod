class AddPositionToFieldEstimators < ActiveRecord::Migration[5.2]
  def change
    add_column :field_estimators, :position, :integer
  end
end
