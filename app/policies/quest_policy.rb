class QuestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.logged_in?
      # 	scope.all
      # else
      # 	scope
      # end
      scope
    end
  end
  def new?
  	user
  end
end
