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
#

class Article < ActiveRecord::Base
  attr_accessible :title, :content, :published, :slug, :title, :user_id, :category_ids, :featured, :published_at, :commentable, :asset_ids, :preview, :image, :remove_image, :image_cache

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, ArticlesUploader

  # Associations
  belongs_to :user
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
  scope :recent, -> do
    where(['published_at >= ?', 14.days.ago])
  end
  scope :published, where(published: true)
  scope :featured, where(featured: true)

  # Callbacks
  before_validation :strip_empty_space
  before_save :check_if_published_changed

  # Methods

  # Returns an array with 10 random articles from the categories the article belongs to
  def related_articles
    articles = []
    self.categories.each do |category|
      articles << category.articles
    end
    articles.flatten.uniq.select { |article| article != self }.sample(10)
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

  # Stores the time the published boolean changed from false to true(excluding the opposite)
  def check_if_published_changed
    self.published_at = Time.now if (("published".in? self.changed) && (published))
  end

  # Strips empty space from strings
  def strip_empty_space
    self.title = title.strip if self.title
    self.preview = preview.strip if self.preview
    self.content = content.strip if self.content
  end

  def should_generate_new_friendly_id?
    new_record?
  end

end
