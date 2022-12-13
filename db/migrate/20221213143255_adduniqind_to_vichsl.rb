class AdduniqindToVichsl < ActiveRecord::Migration[7.0]
  def change
    add_index :vichsls, :digit, unique: true
  end
end
