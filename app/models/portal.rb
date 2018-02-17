class Portal < ApplicationRecord
	belongs_to :user
	has_many :quests

	validates :location, presence: true
	validates :user_id, presence: true
	accepts_nested_attributes_for :quests, :reject_if => :all_blank

	def quest_attributes=(quest_attributes)
		binding.pry
		Quest.create(
			title: quest_attributes[:title],
			karma_impact: quest_attributes[:karma_impact],
			priority: quest_attributes[:priority],
			portal: self
			)
	end

	def self.most_popular
		joins(:quests).group(:portal_id).order("count(*) desc").count
	end
end
