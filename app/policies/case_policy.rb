class CasePolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    @user.superadmin? || @user.admin? || record.workers.include?(@user)
  end

  def update?
    @user.superadmin? || @user.admin? || record.workers.include?(@user)
  end

  def destroy?
    @user.superadmin?
  end


end