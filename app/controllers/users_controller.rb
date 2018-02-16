class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find_by(id: params[:id])
		authorize @user
	end

	def update
		@user = User.find_by(id: params[:id])
		@user.update(user_params)
		redirect_to @user
	end

	private

	def user_params
		params.require(:user).permit(:name)
	end

end