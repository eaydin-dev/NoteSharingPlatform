class Material < ApplicationRecord

	has_attached_file :data
	validates_attachment :data, content_type: { content_type: "application/pdf" }

	def self.search(search)
		where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
		#where("description LIKE ?", "%#{search}%")
	end

end
