class Book < ActiveRecord::Base
  attr_accessible :buy_link, :description, :title, :tag_list, :tag_ids, :coverimage
  has_attached_file :coverimage, :styles => { :medium => "220x500>" },
    :url  => "/assets/books/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/books/:id/:style/:basename.:extension"


  validates_presence_of :buy_link, :description, :title
  validates_attachment_presence :coverimage
  validates_attachment_size :coverimage, :less_than => 5.megabytes
  validates_attachment_content_type :coverimage, :content_type => ['image/jpeg', 'image/png']

  has_many :topics
  has_many :taggings
  has_many :tags, through: :taggings

  scope :recent, limit(5).order("created_at DESC")

  def self.tagged_with(name)
    Tag.find_by_name!(name).books
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.delete_book_image
    @book.coverimage = nil
  end

end
