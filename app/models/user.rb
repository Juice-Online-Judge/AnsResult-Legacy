class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def set_default_role
    self.role ||= :user
  end
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable
end
