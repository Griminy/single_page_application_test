class Thing < ActiveRecord::Base 
  acts_as_taggable

  validates_presence_of :title, :description
  validates :title, length: {in: 3..50}
  validates :category, :address, length: {in: 3..20}, allow_blank: true
  validates :description, length: {in: 3..200}
end