# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class Category < ActiveRecord::Base
  attr_accessible :name

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :articles, uniq: true

  validates :name,
            presence: true,
            length: { in: 1..60 }

  # Returns all categories, sorted by the number of articles each one has
  def self.sorted_by_articles_number
    all.sort_by { |category| category.articles.count }.reverse
  end

end
