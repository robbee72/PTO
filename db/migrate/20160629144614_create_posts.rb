class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :name
      t.string :for_date
      t.text :content
    

      t.timestamps null: false
    end
  end
end
