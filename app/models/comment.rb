class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter
  belongs_to :topic
  validates_presence_of :body
end
