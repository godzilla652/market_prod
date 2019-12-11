class AddGiveRateToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :give_a_rate, :boolean, null: false, default: false
  end
end
