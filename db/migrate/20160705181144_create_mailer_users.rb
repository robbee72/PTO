class CreateMailerUsers < ActiveRecord::Migration
  def change
    create_table :mailer_users do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps null: false
    end
  end
end
