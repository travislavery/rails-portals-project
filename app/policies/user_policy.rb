class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.god
      	scope.all
      else
      	scope.where(id: user.id)
      end
    end
  end

  def show?
  	user.god || record.try(:id) == user.id
  end

  def update? 
  	user.god
  end

  def ascend?
    record.try(:id) == user.id
  end
end
