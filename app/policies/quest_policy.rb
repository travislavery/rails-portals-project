class QuestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def new?
  	user
  end

  def join?
    user || user.admin
  end
end
