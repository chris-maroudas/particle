# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  slug       :string(255)
#  published  :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  featured   :boolean          default(FALSE)
#

class Article < ActiveRecord::Base
  attr_accessible :title, :content, :published, :slug, :title, :user_id, :category_ids, :featured, :published_at

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Associations
  belongs_to :user
  has_and_belongs_to_many :categories, uniq: true

  # Validations
  validates :title,
            presence: true,
            uniqueness: true,
            length: { in: 6..180 }

  validates :content,
            presence: true,
            length: { in: 20..6000 }


  # Scopes
  scope :recent, -> do
    where(['published_at >= ?', 7.days.ago])
  end
  scope :published, where(published: true)
  scope :featured, where(featured: true)

  # Callbacks
  before_validation :strip_empty_space
  before_save :check_if_published_changed

  # Methods
  def check_if_published_changed
    self.published_at = Time.now if (("published".in? self.changed) && (published))
  end

  def strip_empty_space
    self.title = title.strip if self.title
    self.content = content.strip if self.content
  end

  def should_generate_new_friendly_id?
    new_record?
  end

end
