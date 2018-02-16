class PortalsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@portals = Portal.all
	end

	def show
		#binding.pry
		@portal = Portal.find(params[:id])
	end

	def new
		@portal = Portal.new
	end

	def create
		@portal = Portal.new(portal_params)
		@portal.user = current_user
		if @portal.save
			redirect_to @portal
		else
			render :new
		end
	end

	def edit

	end

	def destroy

	end

	private

	def portal_params
		params.require(:portal).permit(:user, :location, quests_attributes: [:title, :karma_impact, :priority])
	end
end
