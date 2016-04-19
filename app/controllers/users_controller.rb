class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:message] = "Only admins may update users"
      redirect_to users_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if !policy(@user).show?
      flash[:message] = "Non Admin: you may only view your own profile"
      redirect_to users_path
    end
  end

  def unapproved
    @users = User.all.where(approved: false)
    flash[:message] = "Only Admins may approved users"
    redirect_to users_path unless current_user.admin?
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :approved, :role)
  end


end
