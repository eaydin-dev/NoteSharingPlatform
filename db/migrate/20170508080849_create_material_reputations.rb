class CreateMaterialReputations < ActiveRecord::Migration[5.0]
  def change
    create_table :material_reputations do |t|
      t.integer :user_id
      t.integer :material_id

      t.timestamps
    end
  end
end
