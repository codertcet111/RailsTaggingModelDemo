class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  validates_uniqueness_of :name

  def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id,tags.name").order(count: :desc)
  end
end
