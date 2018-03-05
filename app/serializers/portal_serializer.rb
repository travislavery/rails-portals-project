class PortalSerializer < ActiveModel::Serializer
  attributes :id, :location
  belongs_to :user, serializer: PortalUserSerializer
  #has_many :quests
end
