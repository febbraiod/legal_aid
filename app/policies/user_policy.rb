class UserPolicy < ApplicationPolicy

  def show?
    # @user == @record || @user.admin?
    true
  end

  def edit?
    # @user.admin?
    true
  end

  def update?
    # user.admin?
    true
  end

  def destroy?
    user.admin?
  end

  def unapproved?
    # user.admin?
    true
  end


end