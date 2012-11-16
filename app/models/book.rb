class Book < ActiveRecord::Base
  attr_accessible :buy_link, :description, :title
  validates_presence_of :buy_link, :description, :title

  has_many :topics

  scope :recent, limit(5).order("created_at DESC")
end
