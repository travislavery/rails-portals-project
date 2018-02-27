class PortalsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@portals = Portal.all
	end

	def show
		@portal = Portal.find(params[:id])
	end

	def new
		@portal = Portal.new
		authorize @portal
	end

	def create
		@portal = Portal.create(portal_params)
		@portal.user = current_user
		if @portal.save
			redirect_to @portal
		else
			render :new, alert: @portal.errors.full_messages.map{|msg| msg } if @portal.errors.any?
		end
	end

	private

	def portal_params
		params.require(:portal).permit(:user, :location, quests_attributes: [:title, :karma_impact, :priority])
	end
end
