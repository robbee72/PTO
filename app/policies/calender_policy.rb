class CalendarPolicy < ApplicationPolicy
  attr_reader :user, :event

  def admin_list?
    user.admin?
  end

  def index?
    user.present? && user.admin?
  end

  def update?
    user.present? && user.admin?
  end

  def show?
    user.present? && user.admin?
  end
end
