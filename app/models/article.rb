# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  slug       :string(255)
#  published  :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :title, :content, :published, :slug, :title, :user_id, :category_ids

  belongs_to :user
  has_and_belongs_to_many :categories

  extend FriendlyId
  friendly_id :title, use: :slugged

end
