class Product < ActiveRecord::Base
  belongs_to :user
  has_one :photo

  accepts_nested_attributes_for :photo
end
