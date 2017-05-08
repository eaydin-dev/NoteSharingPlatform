class CreateUserReputations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_reputations do |t|
      t.integer :user_give
      t.integer :user_recieve

      t.timestamps
    end
  end
end
