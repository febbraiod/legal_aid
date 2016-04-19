class UserPolicy < ApplicationPolicy

  def show?
    @user == @record || @user.admin?
  end

  def edit?
    @user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def unapproved?
    user.admin?
  end


end