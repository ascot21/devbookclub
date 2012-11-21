class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_comment_id
  belongs_to :topic
  validates_presence_of :body, :commenter

  belongs_to :commenter, class_name: "User"

  has_many :replies, class_name: 'Comment', foreign_key: 'parent_comment_id'
  belongs_to :parent_comment, class_name: 'Comment'

  def is_reply?
    parent_comment.present?
  end

  def type
    is_reply? ? "reply" : "comment"
  end

end
