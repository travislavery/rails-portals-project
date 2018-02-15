module QuestsHelper
	def users_with_links(quest)
		list = quest.users.map do |user|
			user_with_link(user)
		end
		list.join(" ")
	end
	def user_with_link(user)
		link_to user.name, user
	end
end
