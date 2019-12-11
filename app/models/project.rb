class Project < ApplicationRecord
  belongs_to :contract, optional: true
  belongs_to :project_address, class_name: "Addressc", inverse_of: :projects, optional: true, dependent: :destroy
  accepts_nested_attributes_for :project_address
end
