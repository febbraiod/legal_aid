class NotePolicy < ApplicationPolicy

  def show?
    false
  end

  def edit?
    @user.superadmin? || record.user == @user
  end

  def update?
    @user.superadmin? || record.user == @user
  end

  def destroy?
    @user.superadmin? || record.user == @user
  end


end