class Gym < ActiveRecord::Base
  has_many :coaches
  has_one :photo

  accepts_nested_attributes_for :photo
end
