class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      # t.integer :task_id
      # t.string :country_id
      # t.string :city
      # t.string :street
    end
  end
end
