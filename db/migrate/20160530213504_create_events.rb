class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer : event_id
      t.string :name
      t.string :for_date
      t.integer :created_by
      t.timestamps null: false
    end
  end
end
