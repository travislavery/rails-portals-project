module QuestsHelper
	def users_with_links(quest)
		list = quest.users.map do |user|
			user_with_link(user)
		end
		list.join(" ")
	end

	def title_link(quest)
		link_to quest.title, quest
	end

	def user_with_link(user)
		link_to user.name, user
	end

	def member_of?(quest)
		if quest.users.include?(current_user)
			button_to "Abandon Quest...", leave_quest_path(@quest)
		else
			button_to "Join Quest!", join_quest_path(@quest)
		end
	end
end
