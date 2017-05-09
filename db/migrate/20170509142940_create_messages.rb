class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :user_sent
      t.integer :user_receive
      t.string :text
      t.integer :notified

      t.timestamps
    end
  end
end
