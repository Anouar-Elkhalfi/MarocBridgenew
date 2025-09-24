class AgencyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
