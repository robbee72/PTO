module SessionsHelper
  def create_session(employee)
    session[:employee_id] = employee.id
  end

  def destroy_session(employee)
    session[:employee_id] = nil
  end

  def current_employee
    Employee.find_by(id: session[:employee_id])
  end
end
