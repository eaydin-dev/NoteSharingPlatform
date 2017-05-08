class AddUserGiveToUserReputation < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :user_reputations, :users, column: :user_give, primary_key: "id"
  	add_foreign_key :user_reputations, :users, column: :user_recieve, primary_key: "id"
  end
end
