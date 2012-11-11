class Topic < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :book
end
