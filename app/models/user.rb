class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

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
