class CreateVichsls < ActiveRecord::Migration[7.0]
  def change
    create_table :vichsls do |t|
      t.float :digit
      t.string :result

      t.timestamps
    end
  end
end
