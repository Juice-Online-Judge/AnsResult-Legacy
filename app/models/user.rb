class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:unauth, :user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :username, :uniqueness => { :case_sensitive => false }

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def set_default_role
    self.role ||= :unauth
  end
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable, :authentication_keys => [:login]
end
