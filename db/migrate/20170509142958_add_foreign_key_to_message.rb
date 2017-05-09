class AddForeignKeyToMessage < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :messages, :users, column: :user_sent, primary_key: "id"
  	add_foreign_key :messages, :users, column: :user_receive, primary_key: "id"
  end
end
