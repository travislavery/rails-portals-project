class PortalsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@portals = Portal.all
	end

	def show
		binding.pry
		@portal = Portal.find(params[:id])
	end

	def create

	end

	def edit

	end

	def destroy

	end

	private

	def portal_params
		params.require(:portal).permit(:id, :user, :location)
	end
end
