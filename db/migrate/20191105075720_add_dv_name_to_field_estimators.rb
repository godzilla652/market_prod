class AddDvNameToFieldEstimators < ActiveRecord::Migration[5.2]
  def change
    add_column :field_estimators, :dv_name, :string
  end
end
