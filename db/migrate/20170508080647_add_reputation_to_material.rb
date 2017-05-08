class AddReputationToMaterial < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :reputation, :integer, :default => 0
  end
end
