class User < ActiveRecord::Base
  #Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable


  has_many :events
  has_many :posts
  before_save {self.email = email.downcase }
  before_save { self.role ||= :employee }


  enum role: [ :employee, :manager, :admin ]

  after_create :initialize_user

#   def admin?
#     role == 'admin'
#   end
#
#   def manager?
#     role == 'manager'
#   end
#
#   def employee?
#     role == 'employee'
#   end
#
  def initialize_user
    self.update_attributes(role: 'employee')
  end

  def upgrade_account
    self.update_attributes(role: 'manager')
  end
#
#   def privatize_calendar?(calendar)
#     (self.manager && calendar.is_owned_by?(self)) || self.admin?
#   end
#
#
#   def public
#     calendars.each do |calendar|
#     calendar.update_attributes(private: true)
#   end
# end
#
#
#   def downgrade_account
#     self.update_attributes(role: "employee")
#     self.make_calendars_public
#   end

end
