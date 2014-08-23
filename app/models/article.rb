# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  content      :text
#  slug         :string(255)
#  published    :boolean          default(FALSE)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  featured     :boolean          default(FALSE)
#  published_at :datetime
#  commentable  :boolean          default(FALSE)
#  preview      :string(255)
#  image        :string(255)
#

class Article < ActiveRecord::Base
  attr_accessible :title, :content, :published, :slug, :title, :user_id, :category_ids, :featured, :published_at,
                  :commentable, :asset_ids, :preview,
                  :image, :remove_image, :image_cache, :rateable

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Full text search on current fields
  acts_as_indexed :fields => [:title, :preview, :content]

  mount_uploader :image, ArticlesUploader

  # Associations
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :assetable_assets, as: :assetable, dependent: :destroy
  has_many :assets, through: :assetable_assets
  has_and_belongs_to_many :categories, uniq: true

  # Validations
  validates :title,
            presence: true,
            uniqueness: true,
            length: { in: 6..180 }

  validates :preview,
            presence: true,
            length: { in: 6..255 }

  validates :content,
            presence: true,
            length: { in: 20..40000 }

  validates_presence_of :categories, :user
  validate :check_words_number

  # Scopes
  scope :recent, -> (max = 10) do
    where(['published_at >= ?', 30.days.ago]).order("published_at DESC").limit(max)
  end

  scope :published, -> (max = nil) do
    where(published: true).order("published_at DESC").limit(max)
  end

  scope :featured, where(featured: true, published: true). order("published_at DESC").limit(1)

  # Callbacks
  before_validation :strip_empty_space
  before_save :check_if_published_changed, :check_if_featured_changed

  # Methods

  def self.popular_articles(limit = 10)
    array_of_articles = self.all
    rated_hash = {}
    array_of_articles.each do |article|
      rated_hash[article] = article.average_rating if article.average_rating
    end
    rated_hash.sort_by { |key, value| value }.collect { |array| array[0] }.reverse[0..(limit-1)]
  end

  # Returns the most related articles according to how many common categories
  # they share together
  def get_most_related_articles(limit)
    rated_articles = {}
    unless remaining_articles(:published).blank?
      remaining_articles(:published).each do |article|
        rated_articles[article] = compute_score_for_related_article(article)
      end
    end
    rated_articles.sort_by{ |key, value| value }.collect { |array| array[0] }.reverse[0..(limit -1)]
  end

  # Returns the result of the total sum of the articles rating divided by their number
  def average_rating
    ratings.present? ? (ratings.map(&:score).sum.to_f) / ratings.count : nil
  end

  # Custom validation that checks if total number of words are above 20
  def check_words_number
    unless content.blank?
      words_number = content.split(" ").count
      if words_number < 20
        errors.add(:content, "Total count of words should be more than 20")
      end
    end
  end

  # If an article is published, store the current time, else set it to nil
  def check_if_published_changed
    if "published".in? self.changed
      self.published_at = published ? Time.now : nil
    end
  end

  # If featured is changed then make sure every other featured article is set to nil
  # There can be only one featured article. Like Highlander.
  def check_if_featured_changed
    if "featured".in?(self.changed) && featured
      unless remaining_articles(:featured).blank?

        remaining_articles(:featured).each do |article|
          article.featured = false
          article.save
        end

      end
    end
  end

  # Strips empty space from strings
  def strip_empty_space
    self.title = title.strip if self.title
    self.preview = preview.strip if self.preview
    self.content = content.strip if self.content
  end

  # Computes chapter number for a published article
  # Chapter depends on published_at time
  def compute_chapter
    unless Article.published.blank?
      Article.published.reverse.index(self) + 1
    end
  end

  # Regenerates new slug when the records column that is being used for slug
  # gets updated
  def should_generate_new_friendly_id?
    new_record?
  end


  private

  # Computes relation score for parameter article
  def compute_score_for_related_article(article)
    score = 0
    unless article.categories.blank?
      article.categories.each do |category|
        if category.in? categories
          score += 1
        end
      end
    end
    score
  end

  # Returns an array with the remaining articles from a certain scope, excluding self
  def remaining_articles(scope)
    Article.send(scope).reject { |article| article == self }
  end

end
