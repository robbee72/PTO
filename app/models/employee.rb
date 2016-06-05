class Employee < ActiveRecord::Base
  before_save { self.email = email.downcase if email.present? }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :employee_number, length: { minimum: 1, maximum: 10}, presence: true
  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
  has_secure_password
end

  classification = ['Hourly non-exempt 4 day week','Hourly non-exempt 5 day week','Management']
