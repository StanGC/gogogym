class Photo < ActiveRecord::Base
  belongs_to :gym
  belongs_to :coach
  belongs_to :product
  mount_uploader :image, ImageUploader
end
