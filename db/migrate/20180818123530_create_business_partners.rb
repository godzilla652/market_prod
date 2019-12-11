class CreateBusinessPartners < ActiveRecord::Migration[5.0]
  def change
    create_table :business_partners do |t|
      t.string :name
      t.references :addressc, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
