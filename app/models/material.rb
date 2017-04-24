class Material < ApplicationRecord

	has_attached_file :data
	validates_attachment :data, content_type: { content_type: "application/pdf" }

end
