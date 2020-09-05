class Post < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  validates_uniqueness_of :title

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |t_tag|
      Tag.where(name: t_tag.strip).first_or_create!
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
