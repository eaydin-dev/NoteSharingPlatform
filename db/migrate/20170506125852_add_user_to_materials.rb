class AddUserToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_reference :materials, :user, foreign_key: true
  end
end
