class Book < ActiveRecord::Base
  attr_accessible :buy_link, :description, :title, :tag_list
  validates_presence_of :buy_link, :description, :title

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

end
