class EventPolicy < ApplicationPolicy
  def show
   record.public? || user.present?
 end

 class Scope
   attr_reader :user, :scope

   def initialize(user, scope)
     @user = user
     @scope = scope
   end

   def resolve
     wikis = []
     if user && user.role == 'admin'
       events = scope.all
     elsif user && user.role == 'admin'
       all_events = scope.all
       all_events.each do |event|
         if event.public? || event.user == user
           events << event
         end
       end
     else # this is the lowly standard user
       all_events = scope.all
       events = []
       all_events.each do |event|
         if event.public?
           events << event
         end
       end
     end
     events
   end
 end
end
