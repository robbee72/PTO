class EventPolicy < ApplicationPolicy

  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def update?
    user.admin? or not post.published?
  end

 #  def show?
 #   record.public? || user.present?
 # end

 def edit
   user.present? && user.admin?
 end
end
