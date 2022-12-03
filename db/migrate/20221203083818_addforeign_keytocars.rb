class AddforeignKeytocars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :driver_id, :integer
    add_foreign_key :cars, :drivers
  end
end
