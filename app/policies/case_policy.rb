class CasePolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    @user.admin? || record.workers.include?(@user)
  end

  def update?
    @user.admin? || record.workers.include?(@user)
  end

  def destroy?
    @user.superadmin?
  end


end