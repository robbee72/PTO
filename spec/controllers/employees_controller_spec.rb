require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let (:new_employee_attributes) do
    {
      name: "Will Robinson",
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
   describe "POST create" do
    it "returns an http redirect" do
      post :create, employee: new_employee_attributes
      expect(response).to have_http_status(:redirect)
    end

# #4
    it "creates a new employee" do
      expect{
        post :create, employee: new_employee_attributes
      }.to change(employee, :count).by(1)
    end

# #5
    it "sets employee name properly" do
      post :create, employee: new_employee_attributes
      expect(assigns(:employee).name).to eq new_employee_attributes[:name]
    end

# #6
    it "sets employee email properly" do
      post :create, employee: new_employee_attributes
      expect(assigns(:employee).email).to eq new_employee_attributes[:email]
    end

# #7
    it "sets employee password properly" do
      post :create, employee: new_employee_attributes
      expect(assigns(:employee).password).to eq new_employee_attributes[:password]
    end

# #8
    it "sets employee password_confirmation properly" do
      post :create, employee: new_employee_attributes
      expect(assigns(:employee).password_confirmation).to eq new_employee_attributes[:password_confirmation]
    end
  end
end
