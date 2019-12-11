class RemoveBodyToEstimators < ActiveRecord::Migration[5.2]
  def change
    remove_column :estimators, :body
  end
end
