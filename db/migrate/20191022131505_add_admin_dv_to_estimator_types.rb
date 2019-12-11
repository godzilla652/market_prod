class AddAdminDvToEstimatorTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :estimator_types, :admin_dv, :boolean
  end
end
