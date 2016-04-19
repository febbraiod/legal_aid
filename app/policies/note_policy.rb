class NotePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def show?
    true
  end

  def update?
    user.admin? || record.user.id == user.id
  end

  def edit?
    true
  end

  def destroy?
    user.admin? || record.user.id == user.id
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
