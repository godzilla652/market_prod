class AddNewFieldToEstimators < ActiveRecord::Migration[5.2]
  def change
    add_column :estimators, :type_estimator, :string
    add_column :estimators, :body, :jsonb
  end
end
