class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
		if @user.persisted? || @user.save
			sign_in_and_redirect @user
		else
			redirect_to root
		end
	end
end