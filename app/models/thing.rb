class Thing < ActiveRecord::Base
  validates_presence_of :title, :description
  validates :title, length: {in: 3..50}
  validates :description, length: {in: 10..200} 
end