require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { Employee.create!(name: "RTI inc. employee", email: "employee@example.com", password: "password") }
   # Shoulda tests for name
   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }

   # Shoulda tests for email
   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email) }
   it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it { is_expected.to allow_value("employee@example.com").for(:email) }

   # Shoulda tests for password
   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }



   describe "invalid employee" do
     let(:employee_with_invalid_name) { Employee.new(name: "", email: "employee@example.com") }
     let(:employee_with_invalid_email) { Employee.new(name: "RTI inc. Employee", email: "") }

     it "should be an invalid employee due to blank name" do
       expect(employee_with_invalid_name).to_not be_valid
     end

     it "should be an invalid employee due to blank email" do
       expect(employee_with_invalid_email).to_not be_valid
     end

   end
end
