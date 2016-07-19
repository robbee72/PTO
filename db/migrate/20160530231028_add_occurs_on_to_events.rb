class AddOccursOnToEvents < ActiveRecord::Migration
  def change
    add_column :event_id, :events, :occurs_on, :date
  end
end
