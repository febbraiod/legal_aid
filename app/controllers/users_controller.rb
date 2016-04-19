class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
    if !policy(@user).edit?
      flash[:message] = "Only admins may edit users"
      redirect_to users_path
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    #authorize @user => this is throwing an error I dont remember getting int he orginal lab.
    if policy(@user).update?
      @user.update(user_params)
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

  def destroy
    @user = User.find_by(id: params[:id])

    if policy(@user).destroy?
      @user.approved = false
      @user.save
      flash[:message] = "User successfully removed from active users"
      redirect_to users_path
    else
      flash[:message] = "Only Admins may delete users"
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
