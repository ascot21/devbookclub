class Topic < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :book

  scope :related, lambda { where("book_id = ? AND topic_id != ?", :book_id, :topic_id ) }
end
