class User < ActiveRecord::Base
  #Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :standard, :premium]

  after_create :initialize_user

  def admin?
    role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  def initialize_user
    self.update_attributes(role: 'standard')
  end

  def upgrade_account
    self.update_attributes(role: 'premium')
  end
  
  def privatize_calendar?(calendar)
    (self.premium? && calendar.is_owned_by?(self)) || self.admin?
  end


  def public
    calendars.each do |calendar|
    calendar.update_attributes(private: true)
  end
end


  def downgrade_account
    self.update_attributes(role: "standard")
    self.make_calendars_public
  end
end
