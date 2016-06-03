class SessionsController < ApplicationController
  def new
  end

  def create

    employee = Employee.find_by(email: params[:session][:email].downcase)

    if employee && employee.authenticate(params[:session][:password])
      create_session(employee)
      flash[:notice] = "Welcome, #{employee.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy

    destroy_session(current_employee)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
