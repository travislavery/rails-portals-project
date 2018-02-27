class Portal < ApplicationRecord
	belongs_to :user
	has_many :quests

	validates :location, presence: true
	validates :user_id, presence: true
	#accepts_nested_attributes_for :quests, :reject_if => :all_blank

	def quests_attributes=(quest_attributes)
		
		quest_attributes.each do |quest|
			binding.pry
			q = Quest.create(
				title: quest[1][:title],
				karma_impact: quest[1][:karma_impact],
				priority: quest[1][:priority],
				)
			self.quests << q
		end
	end

	def self.most_popular
		joins(:quests).group(:portal_id).order("count(*) desc").count
	end
end
