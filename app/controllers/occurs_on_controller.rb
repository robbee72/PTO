class OccursOnController < ApplicationController
  def comment
    @comment = User.all
  end
end
