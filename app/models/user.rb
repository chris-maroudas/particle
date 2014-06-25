# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :article_ids

  has_many :articles, dependent: :destroy
  has_and_belongs_to_many :roles, uniq: true


  before_save :add_default_role


  def role?(role)
    if(role.is_a? String) || (role.is_a? Symbol)
      role.to_s.in? self.roles.map(&:name)
    elsif role.is_a? Array
      self.roles.select do |user_role|
        user_role.name.in? role.map(&:to_s)
      end.present?
    else
      false
    end
  end



  def add_default_role
    self.roles << Role.find_by_name("user")
  end

end
