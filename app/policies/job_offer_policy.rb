class JobOfferPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.admin? ||
      record.published_by == user.recruiter_profile ||
      record.published_by == user.headhunter_profile
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
