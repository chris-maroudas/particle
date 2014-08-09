# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :string(255)
#  article_id :integer
#

class Rating < ActiveRecord::Base
  attr_accessible :score, :article_id

  belongs_to :user
  belongs_to :article

  validates :score,
            presence: true,
            numericality: true,
            inclusion: { in: 1..5 }

  validates :user_id,
            presence: true

  validates :article,
            presence: true



  def self.minimum
    1
  end

  def self.maximum
    5
  end

end
