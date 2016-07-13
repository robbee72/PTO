class HomeController < ApplicationController
  def index

  end

  def about
  end


  def show
    @user = User.first
  end
end
