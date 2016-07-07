class EventPolicy < ApplicationPolicy
    def index?
      false
    end

    def show
      record.public?
    end

    def create?
      show?
    end

    def new?
      show?
    end

    def update?
    show?
  end

  def edit?
    show?
  end

  def destroy?
    user.admin? or user.member?
  end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

    def resolve
      events = []
      if user && user.role == 'admin'
        events = scope.all # if the user is an admin, show them all the events
      elsif  user && user.role == 'member'
        all_events = scope.all
        all_events.each do |event|
          if event.public? || event.user == user  || event.calendar_users.include?(user)
            events << event
          end
        end
      else # this is the lowly employee user
        all_events = scope.all
        events = []
        all_events.each do |event|
          if event.public?  || event.calendar_users.include?(user)
            events << event # only show employee users public events and private events they are a collaborator on
          end
        end
      end
      events # return the events array we've built up
    end
  end
end
