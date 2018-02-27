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

	def join_button?(quest)
		if member_of?(quest)
			button_to "Abandon Quest...", leave_quest_path(@quest)
		else
			button_to "Join Quest!", join_quest_path(@quest)
		end
	end

	def lackey_count?(quest)
		if member_of?(quest)
			button_to "Bring along lackeys?", '/'
		end
	end

	def member_of?(quest)
		if quest.users.include?(current_user)
			return true
		else
			return false
		end
	end

	def get_lackey_count(quest)
		return UserQuest.find_by(quest: quest, user: current_user).lackeys
	end
end
