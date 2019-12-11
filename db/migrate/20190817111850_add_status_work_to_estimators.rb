class AddStatusWorkToEstimators < ActiveRecord::Migration[5.2]
  def change
    add_column :estimators, :status_work, :string
  end
end
