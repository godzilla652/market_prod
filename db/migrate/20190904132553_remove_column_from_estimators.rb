class RemoveColumnFromEstimators < ActiveRecord::Migration[5.2]
  def change
    remove_column :estimators, :sqft
    remove_column :estimators, :stair
    remove_column :estimators, :door
    remove_column :estimators, :closet_door
    remove_column :estimators, :light
    remove_column :estimators, :receptacle
    remove_column :estimators, :new_kitch
    remove_column :estimators, :paint_new_kitch
    remove_column :estimators, :surround
    remove_column :estimators, :vanity
    remove_column :estimators, :toilet
    remove_column :estimators, :accessory
    remove_column :estimators, :cleanfinal
    remove_column :estimators, :type_estimator
    add_column :estimators, :estimator_type_id, :integer, foreign_key: true
  end
end
