class UsersController < ApplicationController
  def show
    session.destroy
    redirect_to root_path
  end
end
