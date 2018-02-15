class Quest < ApplicationRecord
	validates :title, presence: true
	validates :karma_impact, numericality: {only_integer: true}
	validates :priority, presence: true#, uniqueness: { scope: :user }

	has_many :user_quests
	has_many :users, through: :user_quests
	belongs_to :portal

	def list_users
		array = self.users.map do |user|
			user.name
		end
		array.join(", ")
	end
end
