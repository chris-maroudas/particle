class Article < ActiveRecord::Base
  attr_accessible :content, :published, :slug, :title, :user_id

  belongs_to :user
end
