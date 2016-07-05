require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
      
   # #1
       it "responds to role" do
         expect(user).to respond_to(:role)
       end

   # #2
       it "responds to admin?" do
         expect(user).to respond_to(:admin?)
       end

   # #3
       it "responds to member?" do
         expect(user).to respond_to(:member?)
       end
     end

     describe "roles" do
   # #4
       it "is member by default" do
         expect(user.role).to eq("member")
       end

   # #5
       context "member user" do
         it "returns true for #member?" do
           expect(user.member?).to be_truthy
         end

         it "returns false for #admin?" do
           expect(user.admin?).to be_falsey
         end
       end

   # #6
       context "admin user" do
         before do
           user.admin!
         end

         it "returns false for #member?" do
           expect(user.member?).to be_falsey
         end

         it "returns true for #admin?" do
           expect(user.admin?).to be_truthy
         end
       end
     end
   end
