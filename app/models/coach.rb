class Coach < ActiveRecord::Base
  belongs_to :gym
  has_one :photo

  accepts_nested_attributes_for :photo
end
