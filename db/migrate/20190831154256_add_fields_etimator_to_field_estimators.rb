class AddFieldsEtimatorToFieldEstimators < ActiveRecord::Migration[5.2]
  def change
    add_reference :field_estimators, :field_estimator, foreign_key: true
  end
end
