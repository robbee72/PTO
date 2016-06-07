class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
     @employee = Employee.new
     @employee.name = params[:employee][:name]
     @employee.employee_number = params[:employee][:employee_number]
     @employee.email = params[:employee][:email]
     @employee.password = params[:employee][:password]
     @employee.password_confirmation = params[:employee][:password_confirmation]

     if @employee.save
       flash[:notice] = "Welcome to RTI inc. #{@employee.name}!"
       create_session(@employee)
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
   end
     def classification
     @classification = classification

     end

end
