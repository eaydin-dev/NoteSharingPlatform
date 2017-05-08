class AddForeignKeyToComment < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :comments, :users, column: :user_id, primary_key: "id"
  	add_foreign_key :comments, :materials, column: :material_id, primary_key: "id"
  end
end
