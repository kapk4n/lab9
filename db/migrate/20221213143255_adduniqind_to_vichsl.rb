class AdduniqindToVichsl < ActiveRecord::Migration[7.0]
  def change
    add_index :vichsls, :registration_number, unique: true
  end
end
