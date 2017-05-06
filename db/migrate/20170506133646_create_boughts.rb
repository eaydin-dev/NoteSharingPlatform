class CreateBoughts < ActiveRecord::Migration[5.0]
  def change
    create_table :boughts do |t|

      t.timestamps
    end
  end
end
