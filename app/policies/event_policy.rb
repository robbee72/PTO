class EventPolicy < ApplicationPolicy

  attr_reader :user, :post

  def initialize(user, event)
    @user = user
    @event = event
  end

  def update?
    user.admin?
  end

  def show
   record.public? || user.present?
 end

 def edit
   user.present? && user.admin?
 end
