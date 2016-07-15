class ClientPolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.superadmin?
  end


end