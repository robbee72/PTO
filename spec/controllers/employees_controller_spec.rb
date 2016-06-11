require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let (:new_employee_attributes) do
    {
      name: "Will Robinson",
      employee_number: "12345",
      email: "willrobinson@example.com",
      password: "password",
      password_confirmation: "password"

    }
  end
  describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end

     it "instantiates a new employee" do
       get :new
       expect(assigns(:employee)).to_not be_nil
     end
   end
end
