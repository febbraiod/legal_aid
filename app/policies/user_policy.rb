class UserPolicy < ApplicationPolicy

  def show?
    @user == @record || @user.admin? || @user.superadmin?
  end

  def edit?
    @user.superadmin? || user.admin?
  end

  def update?
    user.superadmin? || user.admin?
  end

  def destroy?
    user.superadmin?
  end

  def unapproved?
    user.admin?
  end


end