class SwitchController < ApplicationController

	before_action :authenticate_user!

	def disable
		@user=current_user
		if @user.otp_required_for_login == true
			@user.otp_required_for_login = false
			@user.otp_secret = ""
			@user.save!
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def enable
		@user=current_user
		if @user.otp_required_for_login == false
			@user.otp_required_for_login = true
			@user.otp_secret = User.generate_otp_secret
			@user.save!
		else
			redirect_to root_path
		end
	end

end
