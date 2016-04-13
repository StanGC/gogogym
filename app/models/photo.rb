class Photo < ActiveRecord::Base
  belongs_to :gym
  belongs_to :coach
  mount_uploader :image, ImageUploader
end
