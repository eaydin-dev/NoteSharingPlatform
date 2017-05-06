class AddMaterialToBoughts < ActiveRecord::Migration[5.0]
  def change
    add_reference :boughts, :material, foreign_key: true
  end
end
