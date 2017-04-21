class AddTitleToMaterial < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :title, :string
  end
end
