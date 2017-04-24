class AddAttachmentDataToMaterials < ActiveRecord::Migration
  def self.up
    change_table :materials do |t|
      t.attachment :data
    end
  end

  def self.down
    remove_attachment :materials, :data
  end
end
