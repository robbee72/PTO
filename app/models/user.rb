class User < ActiveRecord::Base
  #Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  #has_many :posts
  before_save {self.email = email.downcase }
  before_save { self.role ||= :member }

  enum role: [ :member, :admin, :premium ]

  after_create :initialize_user


  def admin?
    role == 'admin'
  end

  def member?
    role == 'member'
  end

  def premium?
	    role == 'premium'
  end

  def initialize_user
    self.update_attributes(role: 'member')
  end

  def upgrade_account
    self.update_attributes(role: 'admin')
  end

  def privatize_event?(event)
    (self.admin && event.is_owned_by?(self)) || self.admin?
  end

  def public
    events.each do |event|
    event.update_attributes(private: true)
  end
end
  def downgrade_account
    self.update_attributes(role: "member")
    self.make_event_public
  end
end
