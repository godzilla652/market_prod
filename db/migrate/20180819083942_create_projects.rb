class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :description
      t.string :year_completion
      t.string :value
      t.string :owner_name
      t.integer :project_address_id
      t.string :owner_contact_one
      t.string :phone_one
      t.string :email_one
      t.string :owner_contact_two
      t.string :consultant_two
      t.string :phone_two
      t.string :email_two
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
