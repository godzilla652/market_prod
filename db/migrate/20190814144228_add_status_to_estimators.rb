class AddStatusToEstimators < ActiveRecord::Migration[5.2]
  def change
    add_column :estimators, :status, :string
    add_column :estimators, :archive, :boolean
  end
end
