class Event < ActiveRecord::Base
   has_many :calendars, dependent: :destroy
   belongs_to :user

  # before_create :update_created_by
  # before_update :update_modified_by
  #
  #
  # def update_created_by
  #   self.created_by = current_user_id
  # end
  #
  # def update_modified_by
  #   self.modified_by = current_user_id
  # end
  #
  # def current_user_id
  #   User.current_user.try(:id)
  # end
end
