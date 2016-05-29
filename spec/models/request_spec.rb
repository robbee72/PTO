require 'rails_helper'

RSpec.describe Request, type: :model do
  let(:request) { Request.create!(title: "New Request Title", body: "New Request Body") }

   describe "attributes" do
     it "has title and body attributes" do
       expect(request).to have_attributes(title: "New Request Title", body: "New Request Body")
     end
   end
end
