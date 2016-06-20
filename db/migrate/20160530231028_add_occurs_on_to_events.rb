class AddOccursOnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :occurs_on, :date
  end
end
