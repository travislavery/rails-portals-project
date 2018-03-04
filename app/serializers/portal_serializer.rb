class PortalSerializer < ActiveModel::Serializer
  attributes :id, :location
  has_many :quests
end
