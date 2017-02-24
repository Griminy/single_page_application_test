class Thing < ActiveRecord::Base 
  acts_as_taggable

  validates_presence_of :title, :description
  validates :title, length: {in: 3..50}
  validates :description, length: {in: 3..200}
end