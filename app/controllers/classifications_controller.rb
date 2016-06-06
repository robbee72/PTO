class ClassificationsController < ApplicationController
  def new
    @classifications = Classification.all
  end
end
