class Book < ActiveRecord::Base
  attr_accessible :buy_link, :description, :title
  validates_presence_of :buy_link, :description, :title

  has_many :topics
end
