class AddForeignKeysToMaterialReputation < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :material_reputations, :users, column: :user_id, primary_key: "id"
  	add_foreign_key :material_reputations, :materials, column: :material_id, primary_key: "id"
  end
end
