class Topic < ActiveRecord::Base
  attr_accessible :body, :title, :publish_date, :book_id
  validates_presence_of :body, :title, :publish_date

  belongs_to :book
  has_many :comments
  has_many :parent_comments, class_name: "Comment", conditions: { parent_comment_id: nil }

  scope :related, lambda { where("book_id = ? AND topic_id != ?", :book_id, :topic_id ) }
  scope :published, lambda { where("publish_date < ?", Time.zone.now ) }
  scope :future, lambda { where("publish_date > ?", Time.zone.now ) }

  def published?
    publish_date < Time.zone.now
  end

end
