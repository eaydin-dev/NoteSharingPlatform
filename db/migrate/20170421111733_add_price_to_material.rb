class AddPriceToMaterial < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :price, :integer
  end
end
