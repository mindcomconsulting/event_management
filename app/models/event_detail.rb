class EventDetail < ActiveRecord::Base
	
	has_many :images, as: :imageable
	mount_uploader :image, ImageUploader

end
