class QuestSerializer < ActiveModel::Serializer
  attributes :id, :title, :priority, :karma_impact
  belongs_to :portal, serializer: QuestPortalSerializer
end
