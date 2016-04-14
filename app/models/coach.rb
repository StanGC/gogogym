class Coach < ActiveRecord::Base
  belongs_to :gym
  has_one :photo

  has_many :reservations
  accepts_nested_attributes_for :photo
end
