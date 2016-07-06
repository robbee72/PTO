require 'rails_helper'

RSpec.describe "mailer_users/new", type: :view do
  before(:each) do
    assign(:mailer_user, MailerUser.new(
      :name => "MyString",
      :email => "MyString",
      :login => "MyString"
    ))
  end

  it "renders new mailer_user form" do
    render

    assert_select "form[action=?][method=?]", mailer_users_path, "post" do

      assert_select "input#mailer_user_name[name=?]", "mailer_user[name]"

      assert_select "input#mailer_user_email[name=?]", "mailer_user[email]"

      assert_select "input#mailer_user_login[name=?]", "mailer_user[login]"
    end
  end
end
