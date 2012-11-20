class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :topic
  validates_presence_of :body, :commenter

  belongs_to :commenter, class_name: "User"
end
