class ClientPolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    @user.superadmin? || @user.admin?
  end

  def update?
    @user.superadmin? || @user.admin?
  end

  def destroy?
    @user.superadmin?
  end


end