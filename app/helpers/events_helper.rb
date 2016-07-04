module EventsHelper
  def user_is_authorized_for_events?
       current_user && current_user.admin?
  end
end
