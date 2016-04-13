class Photo < ActiveRecord::Base
  belongs_to :gymnasium

  mount_uploader :image, ImageUploader
end
