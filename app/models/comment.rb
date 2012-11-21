class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_comment_id
  validates_presence_of :body, :commenter

  has_many :replies, class_name: 'Comment', foreign_key: 'parent_comment_id'

  belongs_to :parent_comment, class_name: 'Comment'
  belongs_to :topic
  belongs_to :commenter, class_name: "User"

  scope :parent_comments, where(:parent_comment_id => nil)

  def is_reply?
    parent_comment.present?
  end

  def type
    is_reply? ? "reply" : "comment"
  end

end
