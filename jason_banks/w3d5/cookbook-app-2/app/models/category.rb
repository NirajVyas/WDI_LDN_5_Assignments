class Category < ActiveRecord::Base
  attr_accessible :image, :name
  validates :name, presence: true
end
