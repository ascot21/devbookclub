class Topic < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :book
  has_many :comments
  has_many :parent_comments, class_name: "Comment", conditions: { parent_comment_id: nil }

  scope :related, lambda { where("book_id = ? AND topic_id != ?", :book_id, :topic_id ) }
end
