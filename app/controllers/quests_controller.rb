class QuestsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:portal_id]
			portal = Portal.find_by(id: params[:portal_id])
			if portal.nil?
				redirect_to portals_path, alert: "Portal not found"
			else
				@quests = portal.quests
			end
		else
			@quests = Quest.all
		end
	end

	def show
		if params[:portal_id]
			portal = Portal.find_by(id: params[:portal_id])
			if portal.nil?
				redirect_to portals_path, alert: "Portal not found"
			else
				@quest = portal.quests.find_by(id: params[:id])
				redirect_to portal, alert: "Quest not found" if @quest.nil?
			end
		else
			@quest = Quest.find(params[:id])
		end
	end

	def new
		@portal = Portal.find_by(id: params[:portal_id]) || Portal.first
		@quest = Quest.new
	end

	def create
		@quest = Quest.create(quest_params)
		if @quest.valid?
			redirect_to @quest
		else
			render :new
		end
	end

	def join
		@quest = Quest.find(params[:id])
		authorize @quest
		@quest.users << current_user
		@quest.save
		redirect_to @quest, alert: "Joined #{@quest.title} Quest"
	end

	def leave
		@quest = Quest.find(params[:id])
		if @quest.users.include?(current_user)
			UserQuest.find_by(user: current_user, quest: @quest).destroy
			redirect_to quests_path, alert: "Abandonded #{@quest.title} Quest"
		else
			redirect_to quests_path, alert: "You weren't a part of that quest to begin with!"
		end
	end

	private

	def quest_params
		params.require(:quest).permit(:title, :users, :priority, :completed, :karma_impact, :portal_id)
	end
end
