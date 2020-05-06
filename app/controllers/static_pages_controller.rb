class StaticPagesController < ApplicationController
  def top
    @user = User.find(1)
  end
end
