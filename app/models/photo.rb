class Photo < ActiveRecord::Base
  belongs_to :gym

  mount_uploader :image, ImageUploader
end
