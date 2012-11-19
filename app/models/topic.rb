class Topic < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :book
  has_many :comments

  scope :related, lambda { where("book_id = ? AND topic_id != ?", :book_id, :topic_id ) }
end
