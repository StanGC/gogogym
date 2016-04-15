class Gym < ActiveRecord::Base
  has_many :coaches
  has_one :photo

  default_scope -> { order('RANDOM()') }
  accepts_nested_attributes_for :photo
end
