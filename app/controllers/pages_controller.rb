class PagesController < ApplicationController
  def about

  end

  def homepage
    @user = current_user
  end

end
