class AddUserToBoughts < ActiveRecord::Migration[5.0]
  def change
    add_reference :boughts, :user, foreign_key: true
  end
end
