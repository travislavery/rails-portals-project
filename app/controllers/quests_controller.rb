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
	private

	def quest_params
		params.require(:quest).permit(:title, :users, :priority, :completed, :karma_impact, :portal_id)
	end
end
