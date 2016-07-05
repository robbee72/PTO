class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  has_many :events
  has_many :posts
  # before_save {self.email = email.downcase }
  # before_save { self.role ||= :employee }
  #
  #
  # enum role: [ :employee, :admin ]

end
