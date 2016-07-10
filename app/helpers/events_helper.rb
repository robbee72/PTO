module EventsHelper
  def user_is_authorized_for_events?
       current_user && current_user.admin?
  end

  def display_event_content?(event)
      (event.private && (event.user == current_user || current_user.admin?)) || !event.private
    end
    # def user_authorized_for_private?(event)
    #   ((event.user == current_user || !event.user) && current_user.premium?) || current_user.admin?
    # end
    def display_in_index?(event)
      event.user != current_user && display_event_content?(event)
    end
end
