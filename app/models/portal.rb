class Portal < ApplicationRecord
	belongs_to :user
	has_many :quests

	validates :location, presence: true
	validates :user_id, presence: true
end
